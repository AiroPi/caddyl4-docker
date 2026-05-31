ARG version=2.11.3

FROM caddy:${version}-builder AS builder

RUN xcaddy build \
    --with github.com/mholt/caddy-l4

FROM caddy:${version}

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
