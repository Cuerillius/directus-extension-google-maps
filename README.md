# Google Maps extension

## Development

1. Install dependencies:

   ```bash
   bun install
   ```

2. Build the extension:

   ```bash
   bun run build
   ```

3. Link the extension to your Directus instance:

   ```bash
   bun run link <path>
   ```

   > Replace `<path>` with the path of the Directus `extensions` folder, e.g. `../directus/extensions/`.

### Auto Reload

To automatically reload the extension when changes are made, without having to rebuild the extension and restart Directus, follow these steps:

1. Set this environment variable in your Directus instance:

   ```env
   EXTENSIONS_AUTO_RELOAD=true
   ```

   > This will usually be in your `docker-compose.yml` file.

2. Build the extension and watch for changes:

   ```bash
   bun dev
   ```

## Build

1. Build the extension:

   ```bash
   bun run build
   ```

2. Upgrade the extension:

   ```bash
   bun run upgrade <path>
   ```

   > Replace `<path>` with the path of the Directus `extensions` folder, e.g. `../directus/extensions/`.

   This will copy the built extension to the Directus extensions folder.
