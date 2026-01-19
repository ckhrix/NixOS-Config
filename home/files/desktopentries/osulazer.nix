{
home.file.".local/share/applications/osulazer.desktop".text = ''
[Desktop Entry]
Version=1.5
Type=Application
Name=osu! (Low Quantum)
Comment=A free-to-win rhythm game. Rhythm is just a *click* away!
Icon=osu
Exec=env PIPEWIRE_LATENCY="128/48000" PIPEWIRE_ALSA='{ alsa.period-bytes=1024 alsa.periods=3 }' osu! %u
Terminal=false
MimeType=application/x-osu-beatmap-archive;application/x-osu-skin-archive;application/x-osu-beatmap;application/x-osu-storyboard;application/x-osu-replay;x-scheme-handler/osu;
Categories=Game;
StartupWMClass=osu!
SingleMainWindow=true
StartupNotify=true
'';
}
