package 'gtk+' do
  type :make
  source 'http://ftp.gnome.org/pub/gnome/sources/gtk+/3.0/gtk+-3.0.9.tar.bz2'
  depends_on ['cairo','pango','atk','gtk-pixbuf']
  configure do
    './configure --prefix=/usr --sysconfdir=/etc '
    # TODO check --without-libjasper
  end
  post_install do
    'gdk-pixbuf-query-loaders  > /etc/gtk-2.0/gdk-pixbuf.loaders'
  end
end
