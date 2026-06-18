# video-streaming-app

React + Spring Boot video streaming application.

## Prerequisites

- Java 25
- Maven (or use `./mvnw`)
- Node.js + npm
- PostgreSQL

## Setup

1. Clone the repo
2. Configure database in `backend/src/main/resources/application.yaml`
3. Install frontend dependencies and configure git hooks:
   ```bash
   make install
   make setup
   ```

## Commands

| Command | Description |
|---|---|
| `make dev` | Start frontend and backend in parallel |
| `make frontend` | Start Vite dev server only |
| `make backend` | Start Spring Boot only |
| `make build` | Build both for production |
| `make clean` | Clean build artifacts |

## Testing

| Command | Description |
|---|---|
| `make test` | Run all tests (frontend + backend) |
| `make test-frontend` | Run Vitest unit tests |
| `make test-backend` | Run JUnit tests via Maven |

To run frontend tests in watch mode:
```bash
cd frontend && npm test
```

To run frontend tests with the Vitest UI:
```bash
cd frontend && npm run test:ui
```

## Formatting

| Command | Description |
|---|---|
| `make format` | Format all code |
| `make format-frontend` | Run Prettier on frontend |
| `make format-backend` | Run Google Java Format via Spotless |

The pre-commit git hook runs formatting automatically on staged files.
Install it once after cloning with `make setup`.

**VS Code:** Install the recommended extensions when prompted (`.vscode/extensions.json`).
Formatting on save is pre-configured in `.vscode/settings.json`.
