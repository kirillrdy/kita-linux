package 'gnome-shell' do
  type :make
  source 'http://ftp.gnome.org/pub/GNOME/sources/gnome-shell/3.0/gnome-shell-3.0.0.2.tar.bz2'
  depends_on ["evolution-data-server","gobject-introspection","mutter","gjs","dconf","GConf",
   "glib","gnome-desktop-3","gsettings-desktop-schemas", "gnome-icon-theme",
   "gnome-icon-theme-symbolic","libcanberra","gnome-settings-daemon", "telepathy-glib", "telepathy-logger"]
end


 # optional for future  "gnome-bluetooth","upower"
