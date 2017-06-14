FROM alpine:3.6

# Add language runtimes to support their package managers
RUN apk add --no-cache git ruby ruby-bundler ruby-json nodejs nodejs-npm elixir erlang-crypto

# Add packages to support native package compilation
RUN apk add --no-cache build-base ruby-dev libffi-dev

RUN gem install --no-document specific_install \
  && gem specific_install --location https://github.com/tinfoil/LicenseFinder --branch bsedat/hex-no-http

# Install the hex Elixir package manager
RUN mix local.hex --force

COPY licensefinder_runner /usr/local/bin

WORKDIR /data

ENTRYPOINT ["/usr/local/bin/licensefinder_runner"]
