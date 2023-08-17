FROM node@sha256:2e627b2c2cb49df1f9898a357b48058ff33ba064aaba05e652a6edcae746dfab
SHELL [ "/usr/bin/sh", "-eux", "-c" ]

# Create and define the node_modules's cache directory.
RUN mkdir /usr/src/cache
WORKDIR /usr/src/cache

# Install awesome-lint.
RUN npm install awesome-lint@v0.18.3

# Copy workspace
COPY ./ ./

# Run awesome-list
CMD ["npx", "awesome-lint"]
