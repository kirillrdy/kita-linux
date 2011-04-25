
package 'gobject-introspection' do
  type :make
  depends_on ["glib"]
end


package 'atk' do
  type :make
  depends_on ["glib", "gobject-introspection"]
end


package 'cairo' do
  type :make
  source 'http://www.cairographics.org/releases/cairo-1.10.2.tar.gz'
  depends_on ['xorg','libpng','pixman','fontconfig']
end


package 'pango' do
  type :make
  depends_on ['glib','cairo','xorg','fontconfig','gobject-introspection']
  post_install do
    'pango-querymodules > /etc/pango/pango.modules'
  end
end


package 'gdk-pixbuf' do
  type :make
  depends_on ["glib", "gobject-introspection",'libtiff','libjpeg']
end

package 'gtk+' do
  type :make
  depends_on ["glib", "pango", "atk", "gdk-pixbuf"]
  post_install do
    'gdk-pixbuf-query-loaders  > /etc/gtk-2.0/gdk-pixbuf.loaders'
  end
end


package 'gnome-themes-standard' do
  type :make
  depends_on ["gtk+"]
end


package 'gjs' do
  type :make
  depends_on ["gobject-introspection"]
end


package 'json-glib' do
  type :make
  source 'http://ftp.gnome.org/pub/GNOME/sources/json-glib/0.12/json-glib-0.12.4.tar.bz2'
  depends_on ["gobject-introspection"]
end


package 'clutter' do
  type :make
  depends_on ["json-glib", "gobject-introspection", "atk", "pango", "gdk-pixbuf"]
end


package 'dconf' do
  type :make
  depends_on ["glib", "gobject-introspection", "vala"]
end



package 'GConf' do
  type :make
  depends_on ['ORBit2','libxml2','dbus-glib','gtk+']
  configure do
  '
  ./configure --prefix=/usr \
            --sysconfdir=/etc \
            --libexecdir=/usr/lib/GConf \
            --mandir=/usr/share/man  --disable-defaults-service
  '
  end



#post_install()
#{
#mkdir -p /etc/gconf/gconf.xml.system/
#}
#""

end


package 'mutter' do
  type :make
  depends_on ["clutter", "GConf", "gtk+", "libcanberra",'zenity']
end

package 'zenity' do
  type :make
  depends_on 'gnome-doc-utils'
end

package 'gnome-doc-utils' do
  type :make
  depends_on ['libxslt','XML-Parser','scrollkeeper']
end

package 'librsvg' do
  type :make
  depends_on ["gtk+"]
end


package 'gnome-desktop-3' do
  type :make
  depends_on ["glib", "gtk+", "GConf", "gsettings-desktop-schemas"]
end


package 'libcanberra' do
  type :make
  source 'http://0pointer.de/lennart/projects/libcanberra/libcanberra-0.28.tar.gz'
  depends_on ["gtk+",'libvorbis']
end


package 'gnome-control-center' do
  type :make
  depends_on ["gtk+", "libcanberra", "gnome-desktop-3", "gnome-settings-daemon"]
end


package 'glib-networking' do
  type :make
  depends_on ["glib", "gsettings-desktop-schemas",'gnutls']
end


package 'libsoup' do
  type :make
  depends_on ['gobject-introspection',"glib-networking",'libgnome-keyring','sqlite3']
end

package 'libgnome-keyring' do
  type :make
  depends_on 'dbus'
end

package 'libgdata' do
  type :make
  source 'ftp://ftp.gnome.org/pub/gnome/sources/libgdata/0.8/libgdata-0.8.1.tar.bz2'
  depends_on ["libsoup"]
end


package 'libgweather' do
  type :make
  depends_on ["libsoup", "GConf", "gtk+"]
end


package 'evolution-data-server' do
  type :make
  depends_on ["libgweather", "libgdata", "gtk+",'nss','libical']
end


package 'gnome-power-manager' do
  type :make
  depends_on ["gtk+", "glib", "GConf", "cairo", "libnotify", "libcanberra", "gnome-control-center"]
end


package 'telepathy-glib' do
  type :make
  depends_on ["gobject-introspection"]
end


package 'telepathy-logger' do
  type :make
  depends_on ["telepathy-glib"]
end


package 'gnome-shell' do
  type :make
  depends_on ["evolution-data-server", "gobject-introspection", "mutter", "gjs", "dconf", "GConf", "glib", "gnome-desktop-3", "gsettings-desktop-schemas", "gnome-icon-theme", "gnome-icon-theme-symbolic", "libcanberra", "gnome-settings-daemon", "gnome-bluetooth", "telepathy-glib", "telepathy-logger", "upower"]
end


package 'gnome-bluetooth' do
  type :make
  depends_on ["gobject-introspection", "gnome-control-center", "libnotify"]
end


package 'libnotify' do
  type :make
  depends_on ["glib", "gtk+"]
end


package 'gnome-settings-daemon' do
  type :make
  depends_on ["glib", "gtk+", "gnome-desktop-3", "libgnomekbd", "libnotify", "polkit"]
end


package 'libgnomekbd' do
  type :make
  depends_on ["glib", "libxklavier"]
end


package 'gnome-shell-using-gir-repository' do
  type :make
  depends_on ["gnome-shell-full"]
end


package 'gnome-shell-full' do
  type :make
  depends_on ["librsvg", "gnome-themes-standard", "gnome-shell", "gnome-power-manager"]
end


package 'vala' do
  type :make
  depends_on ["glib"]
end


package 'polkit' do
  type :make
  depends_on ["glib", "gobject-introspection"]
end


package 'upower' do
  type :make
  depends_on ["polkit", "gobject-introspection", "gudev"]
end


package 'libxklavier' do
  type :make
  depends_on ["glib"]
end


package 'gsettings-desktop-schemas' do
  type :make
end



