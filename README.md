# eventhub

Playwright test suite.

## Running the tests (Docker, no local setup required)

You don't need Node.js, browsers, or any dependencies installed locally — only [Docker](https://docs.docker.com/get-docker/).

```sh
docker compose run --build --rm tests
```

This builds a container image (pinned to the same Playwright version as `package.json`), runs the test suite inside it, and removes the container when done. The container's exit code matches the test result.

The HTML report and test results are written back to your machine in `playwright-report/` and `test-results/`. View the report with:

```sh
npx playwright show-report
```

(or just open `playwright-report/index.html` in a browser).

## Running locally without Docker

```sh
npm ci
npx playwright install --with-deps
npx playwright test
```
