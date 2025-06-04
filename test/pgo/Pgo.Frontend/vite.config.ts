import { defineConfig } from 'vite';
import { svelte } from '@sveltejs/vite-plugin-svelte';
import fs from 'fs';
import path from 'path';
import child_process from 'child_process';

let key: Buffer | null = null;
let cert: Buffer | null = null;

const isProduction = process.env.NODE_ENV === 'production';

if (!isProduction) {
    const baseFolder =
        process.env.APPDATA !== undefined && process.env.APPDATA !== ''
            ? `${process.env.APPDATA}/ASP.NET/https`
            : `${process.env.HOME}/.aspnet/https`;

    const certificateArg = process.argv.map(arg => { const match = arg.match(/--name=(.+)/i); return match ? match[1] : null; }).filter(Boolean)[0];
    const certificateName = certificateArg ? certificateArg : "pgo-beeldinpgo-frontend";

    if (!certificateName) {
        console.error('Invalid certificate name. Run this script in the context of an npm/yarn script or pass --name=<<app>> explicitly.')
        process.exit(-1);
    }

    const certFilePath = path.join(baseFolder, `${certificateName}.pem`);
    const keyFilePath = path.join(baseFolder, `${certificateName}.key`);

    if (!fs.existsSync(certFilePath) || !fs.existsSync(keyFilePath)) {
        if (0 !== child_process.spawnSync('dotnet', [
            'dev-certs',
            'https',
            '--export-path',
            certFilePath,
            '--format',
            'Pem',
            '--no-password',
        ], { stdio: 'inherit', }).status) {
            throw new Error("Could not create certificate.");
        }
    }

    key = fs.readFileSync(keyFilePath);
    cert = fs.readFileSync(certFilePath);
}

// https://vitejs.dev/config/
export default defineConfig({
    plugins: [svelte()],
    build: { minify: 'terser' },
    server: { 
        proxy: {
            '^/api/.*': {
                target: 'https://localhost:5182/',
                secure: false
            },
            '^/bff/.*': {
                target: 'https://localhost:5182/',
                secure: false
            },
            '^/signin-oidc': {
                target: 'https://localhost:5182/',
                secure: false
            },
            '^/signout-callback-oidc': {
                target: 'https://localhost:5182/',
                secure: false
            },
        },
        port: 5173,
        https: {
            key: key,
            cert: cert,
        }
    }
})