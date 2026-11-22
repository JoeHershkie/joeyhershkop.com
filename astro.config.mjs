// @ts-check
import { defineConfig } from 'astro/config';

// https://astro.build/config
export default defineConfig({
  site: 'https://joeyhershkop.com',
  output: 'static',
  devToolbar: {
    enabled: false
  }
});
