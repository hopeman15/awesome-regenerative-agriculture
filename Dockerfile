FROM node@sha256:6de16cdb0f12357271f100634266d6aec99d9245b4d99523668f808bf1e75c2c
SHELL [ "/usr/bin/sh", "-eux", "-c" ]

# Create and define the node_modules's cache directory.
RUN mkdir /usr/src/cache
WORKDIR /usr/src/cache

# Install awesome-lint & markdownlint
RUN npm install awesome-lint@v0.18.3 markdownlint-cli2@v0.9.2 --global

# Ensure to only lint md files within this project
WORKDIR /workspace

# Copy workspace
COPY ./ ./

# Lint markdown files
CMD ["make", "check-markdown"]
