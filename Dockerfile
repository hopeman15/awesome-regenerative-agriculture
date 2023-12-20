FROM node@sha256:b632a1ec41a0927d19a432c525641b9a4451251d0b0b63f1d764810a562ea4e1
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
