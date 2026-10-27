# DailyCalendar

DailyCalendar lets users log their day-to-day expenses and notes in one place, with monthly and yearly summaries.

## Status

Work in progress. The repository structure, tooling and database configuration are in place. The application itself is not built yet, so there is nothing to run.

## Planned stack

- React frontend and Express API, both in JavaScript
- PostgreSQL hosted on Supabase, used as a database only
- Tests: API tests and end-to-end tests

## Requirements

- Node.js 24 (the server declares `>=24.0.0 <25.0.0`)
- npm (installed with Node.js)
- Git
- Docker Desktop, needed later for the local database (not required for the setup below)

## Repository layout

- `client/` - the React frontend (not built yet)
- `server/` - the Express API and database configuration
  - `server/supabase/` - Supabase CLI configuration; database migrations will be added here
- `e2e/` - end-to-end tests (not built yet)

## Setup (what works today)

From a terminal (Git Bash on Windows):

```
git clone https://github.com/Mukul0223/DailyCalendar.git
cd DailyCalendar/server
npm ci
cp .env.example .env
npx supabase --version
```

- `npm ci` installs the exact versions recorded in `package-lock.json`.
- `.env` holds your real settings and is never committed. For now it only contains placeholder values from `.env.example`.
- The last command should print the Supabase CLI version (2.122.0).

## Running and testing

Not available yet. Run and test commands will be added as the project grows.
