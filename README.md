# DailyCalendar

DailyCalendar lets users log their day-to-day expenses and notes in one place, with monthly and yearly summaries.

## Status

Work in progress. The repository structure, tooling and database schema are in place. The application itself is not built yet, so there is nothing to run except the database.

## Planned stack

- React frontend and Express API, both in JavaScript
- PostgreSQL hosted on Supabase, used as a database only
- Tests: API tests and end-to-end tests

## Requirements

- Node.js 24 (the server declares `>=24.0.0 <25.0.0`)
- npm (installed with Node.js)
- Git
- Docker Desktop, to run the local database

## Repository layout

- `client/` - the React frontend (not built yet)
- `server/` - the Express API and database configuration
  - `server/supabase/` - Supabase CLI configuration and the database migrations
- `e2e/` - end-to-end tests (not built yet)

## Setup

From a terminal (Git Bash on Windows):

```
git clone https://github.com/Mukul0223/DailyCalendar.git
cd DailyCalendar/server
npm ci
cp .env.example .env
npx supabase --version
```

- `npm ci` installs the exact versions recorded in `package-lock.json`.
- `.env` holds your real settings and is never committed. Fill in the values described in `.env.example`.

## Database

The schema lives in `server/supabase/migrations/` as numbered SQL files: the five tables, their indexes, and the eight starter categories. Row Level Security is enabled on every table and the local Supabase Data API is turned off, so the database is reached only through the server.

Run these from `server/`, with Docker Desktop running.

Start the local database (the first run downloads images and can take several minutes):

```
npx supabase start
npx supabase status
```

`status` prints the local database URL. Put it in `DATABASE_URL` and `TEST_DATABASE_URL` in your `.env`.

Rebuild the local database from scratch by replaying every migration:

```
npx supabase db reset
```

Stop it:

```
npx supabase stop
```

Do not edit a migration that has already been applied to a hosted project. Fix mistakes with a new migration.

### Using a hosted Supabase project (optional)

Create a project on supabase.com, turn its Data API off, then from `server/`:

```
npx supabase login
npx supabase link --project-ref <your-project-ref>
npx supabase db push --linked
```

The database password is a secret. Keep it only in your `.env` and a password manager, never in a commit. A long-running server on an IPv4-only network should use the session pooler connection string from the project's Connect panel.

## Running and testing

Not available yet. Run and test commands will be added as the project grows.
