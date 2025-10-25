# Snapcast Add-on for Home Assistant

Snapcast server and client for multi-room audio streaming with Music Assistant integration. Similar to the add-on available to the store, but without Spotify Connect functionality so that you can use Music Assistant's Spotify Connect plugin instead.

## Features

- Snapcast Server + Client on your Raspberry Pi
- Works with Music Assistant
- Web interface on port 1780
- No LibreSpot conflicts
- Comprehensive debugging

## Quick Start

1. Copy to `/addons/snapcast/` on Home Assistant
2. Set permissions: `chmod +x rootfs/etc/services.d/*/run rootfs/etc/services.d/*/finish`
3. Reload add-on store → Install → Start
4. Access web UI or use with Music Assistant

## Ports

- 1704: Client connections
- 1705: Control API
- 1780: Web interface

## Configuration

Default settings work for most users. Customize:
- Buffer (latency)
- Codec (quality)
- Sample format
- Custom streams

See configuration tab in Home Assistant for options.
