import { defineConfig } from 'vite';
import laravel from 'laravel-vite-plugin';
import react from '@vitejs/plugin-react';
import vue from '@vitejs/plugin-vue';

import fs from 'fs';
import dotenv from 'dotenv';
const env = dotenv.parse(fs.readFileSync('.env'));
const reactStack = env.APP_STACK !== 'vue';
const packagesAreInstalled = fs.existsSync('node_modules/@inertiaui/modal-react') && fs.existsSync('node_modules/@inertiaui/modal-vue');

export default defineConfig({
    resolve: packagesAreInstalled ? {} : {
        dedupe: ['@inertiajs/react', '@inertiajs/vue3', 'axios'],
        alias: {
            '@inertiaui/modal-react': '/vendor/inertiaui/modal/react/dist/inertiaui-modal',
            '@inertiaui/modal-vue': '/vendor/inertiaui/modal/vue/dist/inertiaui-modal'
        }
    },

    plugins: [
        laravel({
            input: reactStack ? 'resources/js/app.jsx' : 'resources/js/app.js',
            refresh: true,
        }),
        reactStack ? react() : vue({
            template: {
                transformAssetUrls: {
                    base: null,
                    includeAbsolute: false,
                },
            },
        }),
    ],
    server: {
        host: '0.0.0.0',
        port: 5173,
        hmr: {
            host: 'localhost',
        },
    },
});
