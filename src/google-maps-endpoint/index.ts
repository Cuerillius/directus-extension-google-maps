import { defineEndpoint } from "@directus/extensions-sdk";

export default defineEndpoint((router, { env }) => {
  const GOOGLE_MAPS_API_KEY = env.GOOGLE_MAPS_API_KEY;
  router.get("/google-maps-api-key", (_req, res) =>
    res.json(GOOGLE_MAPS_API_KEY)
  );
});
