FROM node@sha256:3bdf79739cc6e755ad50e1e540304d6791832e14c2ce4cef4a960f2207e4ff5b
SHELL [ "/usr/bin/sh", "-eux", "-c" ]

# Create and define the node_modules's cache directory.
RUN mkdir /usr/src/cache
WORKDIR /usr/src/cache

# Install awesome-lint & markdownlint
RUN npm install awesome-lint@v1.1.0 markdownlint-cli2@v0.13.0 --global

# Ensure to only lint md files within this project
WORKDIR /workspace

# Copy workspace
COPY ./ ./

# Lint markdown files
CMD ["make", "check-markdown"]
