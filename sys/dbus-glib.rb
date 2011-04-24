package 'dbus-glib' do
  type :make
  source "http://dbus.freedesktop.org/releases/dbus-glib/dbus-glib-0.88.tar.gz"
  depends_on ['glib','dbus','expat']
end
