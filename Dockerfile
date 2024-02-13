FROM node@sha256:90eb0224aac0332a91fe896432daab777bd234d266c51fcd16edbeb42319ad39
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
