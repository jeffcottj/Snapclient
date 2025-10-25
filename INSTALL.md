# Installation Guide

## Method 1: Local Add-on (Recommended)

1. **Copy files to Home Assistant**
   - Use SSH/SFTP/Samba to copy this directory to `/addons/snapcast/`

2. **Set executable permissions**
   SSH into Home Assistant and run:
   ```bash
   cd /addons/snapcast
   chmod +x rootfs/etc/services.d/dbus/run
   chmod +x rootfs/etc/services.d/dbus/finish
   chmod +x rootfs/etc/services.d/avahi/run
   chmod +x rootfs/etc/services.d/avahi/finish
   chmod +x rootfs/etc/services.d/snapcast-server/run
   chmod +x rootfs/etc/services.d/snapcast-server/finish
   chmod +x rootfs/etc/services.d/snapcast-client/run
   chmod +x rootfs/etc/services.d/snapcast-client/finish
   ```

3. **Reload and install**
   - Settings → Add-ons → ⋮ menu → Check for updates
   - Refresh browser
   - Find "Snapcast" in Local Add-ons
   - Install → Start

## Method 2: GitHub Repository

1. **Create repo and push**
   ```bash
   git init
   git add .
   git commit -m "Snapcast add-on"
   git remote add origin https://github.com/YOUR_USERNAME/hassio-snapcast.git
   git push -u origin main
   ```

2. **Add to Home Assistant**
   - Settings → Add-ons → Add-on Store → ⋮ → Repositories
   - Add: `https://github.com/YOUR_USERNAME/hassio-snapcast`
   - Install Snapcast

## Verify Installation

Check logs for:
```
=== D-BUS DAEMON DEBUG START ===
=== AVAHI DAEMON DEBUG START ===
=== SNAPCAST SERVER DEBUG START ===
=== SNAPCAST CLIENT DEBUG START ===
```

All should start successfully without errors.

## Post-Installation

1. Access web UI (port 1780)
2. Verify "home-assistant" client is connected
3. Install Music Assistant
4. Music Assistant should auto-discover the server
5. Test audio playback!
