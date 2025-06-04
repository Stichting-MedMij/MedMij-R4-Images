import { get, writable, derived } from 'svelte/store';
import { base } from './baseurl-store';

export interface AuthState {
    loggedIn: boolean;
    logoutUrl: string;
    username: string;
}

const defaultAuthState: AuthState = {
    loggedIn: false,
    logoutUrl: '',
    username: '',
};

export const authStore = writable<AuthState>(defaultAuthState);

export const isLoggedIn = derived(authStore, $authStore => $authStore.loggedIn);

// URLs for duende Backend for Frontend(BFF) authentication endpoints
const urlBffLogin = '/bff/login';
const urlBffLogout = '/bff/logout';
const urlBffUser = '/bff/user';

interface Claim {
    type: string;
    value: string;
}

async function fetchUserData(): Promise<Claim[]> {
    const baseUrl = get(base);
    const response = await fetch(`${baseUrl}${urlBffUser}`, {
        headers: {
            "X-CSRF": "1", // Required header for BFF middleware
        },
    });

    if (!response.ok) {
        throw new Error(`Failed to fetch user data: ${response.statusText}`);
    }

    return response.json();
}

/**
 * Fetches the user's login status and updates the authStore accordingly.
 * @returns {Promise<boolean>} - Whether the user is logged in.
 */
export async function fetchIsUserLoggedIn(): Promise<boolean> {
    try {
        const data = await fetchUserData();

        const logoutClaim = data.find((claim: Claim) => claim.type === "bff:logout_url");
        const usernameClaim = data.find((claim: Claim) => claim.type === "name");

        const logoutUrl = logoutClaim?.value ?? urlBffLogout;
        const username = usernameClaim?.value ?? 'unknown';

        authStore.set({
            loggedIn: true,
            logoutUrl,
            username,
        });

        return true;
    } catch (error) {
        console.error('Error fetching user status:', error);
        authStore.set(defaultAuthState);

    }

    return false;
}

function CreateEncodedReturnUrl(): string {
    return encodeURIComponent(window.location.pathname + window.location.search || '/');
}

/**
 * Redirects the user to the login endpoint with a return URL.
 */
export function login(): void {
    const baseUrl = get(base);
    const returnUrl = CreateEncodedReturnUrl()
    window.location.href = `${baseUrl}${urlBffLogin}?returnUrl=${returnUrl}`;
}

/**
 * Logs the user out and redirects to the logout URL with a return URL.
 */
export function logout(): void {
    const auth = get(authStore);

    if (auth.loggedIn) {
        const baseUrl = get(base);
        const returnUrl = CreateEncodedReturnUrl();
        window.location.href = `${baseUrl}${auth.logoutUrl}&returnUrl=${returnUrl}`;
    }
}