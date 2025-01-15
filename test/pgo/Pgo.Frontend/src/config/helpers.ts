
export interface StatusResponse {
    isSuccess: boolean;
    message: string;
}

/* Helper functions */

export const defaultFetchOptions: RequestInit = {
    headers: new Headers({
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Accept-Encoding': 'gzip',
        'X-CSRF': '1', // Required header for BFF middleware
    }),
    cache: 'no-store'
}

export async function ensureSuccess(response: Response) {
    if (!response.ok) {
        throw new Error(response.statusText);
    }

    // const status: StatusResponse = await response.json();
    // if (!status.isSuccess) {
    //     throw new Error(status.message);
    // }
}

export function sortDescending(a: string, b: string): number {
    return b.localeCompare(a);
}