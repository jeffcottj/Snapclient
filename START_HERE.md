# Snapcast Add-on - Start Here

## What You Have

A complete Snapcast server + client add-on for Home Assistant (v1.0.2) with comprehensive debugging.

## What It Does

- Runs Snapcast **SERVER** on your Raspberry Pi
- Runs Snapcast **CLIENT** connecting to local server
- Makes your Pi available as a media player for Music Assistant
- No LibreSpot conflicts with Music Assistant's Spotify

## Directory Structure

```
Snapclient/
├── config.json          # Add-on configuration
├── Dockerfile           # Container with server+client+debugging tools
├── rootfs/              # Service files
│   └── etc/
│       ├── avahi/
│       │   └── avahi-daemon.conf
│       └── services.d/
│           ├── dbus/           # D-Bus service (run + finish)
│           ├── avahi/          # Avahi/mDNS (run + finish)
│           ├── snapcast-server/  # Server (run + finish)
│           └── snapcast-client/  # Client (run + finish)
├── README.md            # Quick reference
└── INSTALL.md           # Installation instructions
```

## Quick Install

1. **Copy to Home Assistant**
   ```bash
   # Copy entire Snapclient directory to /addons/snapcast/
   ```

2. **Set Permissions** (Important!)
   ```bash
   cd /addons/snapcast
   chmod +x rootfs/etc/services.d/*/run
   chmod +x rootfs/etc/services.d/*/finish
   ```

3. **Install in Home Assistant**
   - Settings → Add-ons → ⋮ → Check for updates
   - Find "Snapcast" in Local Add-ons
   - Install → Start

4. **Check Logs**
   Should see debug sections for all 4 services:
   - D-BUS DAEMON DEBUG START
   - AVAHI DAEMON DEBUG START
   - SNAPCAST SERVER DEBUG START
   - SNAPCAST CLIENT DEBUG START

## What the Logs Will Show

### Success Case:
```
[dbus] === D-BUS DAEMON DEBUG START ===
[dbus] Starting dbus-daemon...

[avahi] === AVAHI DAEMON DEBUG START ===
[avahi] D-Bus socket ready after 0 seconds
[avahi] Starting avahi-daemon...

[snapcast-server] === SNAPCAST SERVER DEBUG START ===
[snapcast-server] Avahi daemon ready after 1 seconds
[snapcast-server] Configuration values: BUFFER=1000 ...
[snapcast-server] === Generated snapserver.conf ===
[snapcast-server] source = pipe:///tmp/snapfifo?name=default&mode=create
[snapcast-server] Snapserver binary found, checking version: v0.26.0
[snapcast-server] Port 1704 is free
[snapcast-server] === Starting snapserver process ===

[snapcast-client] === SNAPCAST CLIENT DEBUG START ===
[snapcast-client] Avahi daemon ready after 0 seconds
[snapcast-client] netcat found, waiting for snapcast server on port 1704...
[snapcast-client] Port check returned success at 3 seconds!
[snapcast-client] === Starting snapclient process ===
```

### If Something Fails:
The logs will show exactly what went wrong with detailed diagnostics.

## Troubleshooting

**Connection loop?**
- Check if snapserver actually started (look for "Starting snapserver process")
- Check if port 1704 is listening (shown every 10s in client logs)
- Look for snapserver error messages

**Permission errors?**
- Make sure you ran chmod +x on all run and finish scripts

**Config errors?**
- Check "Generated snapserver.conf" section in logs
- Should have at least one stream source

## Using with Music Assistant

1. Install this add-on first
2. Install Music Assistant
3. Music Assistant auto-discovers the Snapcast server
4. "home-assistant" client appears as available player
5. Play music → it streams to your Pi!

## Web Interface

Access at: `http://homeassistant.local:1780`
- View connected clients
- Adjust volume
- Monitor streams

## Next Steps

1. Read [INSTALL.md](INSTALL.md) for detailed installation
2. Install the add-on
3. Check logs for any errors
4. Test with Music Assistant

## Version Info

- **Version**: 1.0.2
- **Snapcast**: 0.26.0
- **Debugging**: Comprehensive (all services)
- **LibreSpot**: Removed (no Spotify conflicts)

---

**Ready to install!** Follow the Quick Install steps above.
