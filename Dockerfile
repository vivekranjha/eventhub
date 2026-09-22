FROM node:24-bookworm-slim

# WebKit needs an up-to-date CA bundle for TLS; the slim base image doesn't
# ship one by default.
RUN apt-get update && apt-get install -y --no-install-recommends ca-certificates \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY package*.json ./
RUN npm ci

COPY . .

# Installs all browsers Playwright supports (chromium, firefox, webkit)
# along with their required OS-level dependencies.
RUN npx playwright install --with-deps

CMD ["npx", "playwright", "test"]
