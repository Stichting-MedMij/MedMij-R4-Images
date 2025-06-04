/* The main.ts creates App.svelte as the JavaScript startup for Svelte app, bootstrapped by index.html. */
import './app.css'
import App from './App.svelte'

const app = new App({
  target: document.getElementById('app')!,
})

export default app