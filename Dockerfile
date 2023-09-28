FROM node@sha256:1155995dda741e93afe4b1c6ced2d01734a6ec69865cc0997daf1f4db7259a36
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
