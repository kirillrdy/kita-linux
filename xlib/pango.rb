package 'pango' do
  type :make
  source 'http://ftp.gnome.org/pub/gnome/sources/pango/1.28/pango-1.28.2.tar.bz2'
  depends_on ['glib','cairo','xorg','fontconfig']
  post_install do
    'pango-querymodules > /etc/pango/pango.modules'
  end
end
