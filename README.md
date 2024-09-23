# Google Maps extension

## Getting Started

### Prerequisites

- Bun
- Directus instance (Docker Compose)
- Google Maps API Key from [here](https://developers.google.com/maps/documentation/javascript/get-api-key)

### Environment variables

Add the following environment variables to your `docker-compose.yml` file, replacing the placeholder with your API key:

```yml
      GOOGLE_MAPS_API_KEY: "REPLACE-WITH-API-KEY"
      CONTENT_SECURITY_POLICY_DIRECTIVE__CONNECT_SRC: "'self' https:"
      CONTENT_SECURITY_POLICY_DIRECTIVES__SCRIPT_SRC: "'self' 'unsafe-inline' 'unsafe-eval' https://maps.googleapis.com"
      CONTENT_SECURITY_POLICY_DIRECTIVES__MEDIA_SRC: "'self' blob: data: https://maps.gstatic.com https://maps.googleapis.com"
      CONTENT_SECURITY_POLICY_DIRECTIVES__IMG_SRC: "'self' blob: data: https://maps.gstatic.com https://maps.googleapis.com khmdb0.google.com khmdb0.googleapis.com khmdb1.google.com khmdb1.googleapis.com khm.google.com khm.googleapis.com khm0.google.com khm0.googleapis.com khm1.google.com khm1.googleapis.com khms0.google.com khms0.googleapis.com khms1.google.com khms1.googleapis.com khms2.google.com khms2.googleapis.com khms3.google.com khms3.googleapis.com streetviewpixels-pa.googleapis.com"
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
