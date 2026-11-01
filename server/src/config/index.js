import { existsSync } from "node:fs";

if (existsSync(".env")) {
  process.loadEnvFile(".env");
}

const requiredVars = [
  "ACCESS_TOKEN_SECRET",
  "REFRESH_TOKEN_SECRET",
  "DATABASE_URL",
  "TEST_DATABASE_URL",
  "COOKIE_SECURE",
  "CLIENT_ORIGIN",
  "NODE_ENV",
];

const missingVars = requiredVars.filter((varName) => !process.env[varName]);

if (missingVars.length > 0) {
  throw new Error(
    `Missing required environment variables: ${missingVars.join(", ")}`,
  );
}

if (process.env.ACCESS_TOKEN_SECRET === process.env.REFRESH_TOKEN_SECRET) {
  throw new Error(
    "ACCESS_TOKEN_SECRET and REFRESH_TOKEN_SECRET must be different.",
  );
}

let port = 8080;
if (process.env.PORT) {
  const parsedPort = Number(process.env.PORT);
  if (!Number.isInteger(parsedPort) || parsedPort < 1 || parsedPort > 65535) {
    throw new Error(
      `Invalid PORT environment variable: "${process.env.PORT}". Must be an integer between 1 and 65535.`,
    );
  }
  port = parsedPort;
}

const cookieSecure = process.env.COOKIE_SECURE === "true";

const config = Object.freeze({
  env: process.env.NODE_ENV,
  port,
  databaseUrl: process.env.DATABASE_URL,
  testDatabaseUrl: process.env.TEST_DATABASE_URL,
  clientOrigin: process.env.CLIENT_ORIGIN,
  accessSecret: process.env.ACCESS_TOKEN_SECRET,
  accessTtl: process.env.ACCESS_TOKEN_TTL || "15m",
  refreshSecret: process.env.REFRESH_TOKEN_SECRET,
  refreshTtl: process.env.REFRESH_TOKEN_TTL || "7d",
  cookieSecure,
});

export default config;
