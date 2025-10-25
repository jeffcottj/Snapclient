ARG BUILD_FROM=ghcr.io/hassio-addons/base:13.0.0
FROM ${BUILD_FROM}

# Install runtime packages and debugging tools
RUN apk add --no-cache \
    dbus \
    nss \
    avahi-compat-libdns_sd \
    avahi \
    pulseaudio \
    alsa-plugins-pulse \
    snapcast \
    netcat-openbsd \
    net-tools \
    iproute2 \
    procps \
    lsof

# Copy root filesystem
COPY rootfs /

# Labels
LABEL \
    io.hass.name="Snapcast" \
    io.hass.description="Snapcast server and client for Home Assistant" \
    io.hass.arch="armhf|armv7|aarch64|amd64|i386" \
    io.hass.type="addon" \
    io.hass.version="1.0.2" \
    maintainer="Your Name" \
    org.opencontainers.image.title="Snapcast" \
    org.opencontainers.image.description="Snapcast server and client for Home Assistant" \
    org.opencontainers.image.vendor="Home Assistant Community" \
    org.opencontainers.image.licenses="Apache-2.0" \
    org.opencontainers.image.source="https://github.com/yourusername/snapcast-addon"
