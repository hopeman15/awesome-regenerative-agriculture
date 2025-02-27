FROM node@sha256:24eee994bf6f001537b696fe35b3bcbcb2ff639a8e3cd7af2629e71cd3f15ed0
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
