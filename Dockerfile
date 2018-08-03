FROM alpine:3.6

# Add language runtimes to support their package managers
RUN apk add --no-cache git ruby ruby-bundler ruby-json nodejs nodejs-npm elixir erlang-crypto

# Add packages to support native package compilation
RUN apk add --no-cache build-base ruby-dev libffi-dev

RUN gem install --no-document --conservative license_finder

# Install the hex Elixir package manager
RUN mix local.hex --force

# Install the yarn JS package manager
RUN npm install --global yarn

COPY licensefinder_runner /usr/local/bin

WORKDIR /data

ENTRYPOINT ["/usr/local/bin/licensefinder_runner"]
