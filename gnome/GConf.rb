package 'GConf' do
  type :make
  depends_on ['ORBit2','libxml2','gtk+', 'polkit']
  source 'ftp://ftp.gnome.org/pub/gnome/sources/GConf/2.32/GConf-2.32.2.tar.bz2'
  configure do
  '
  ./configure --prefix=/usr \
            --sysconfdir=/etc \
            --libexecdir=/usr/lib/GConf \
            --mandir=/usr/share/man #--disable-defaults-service
  '
  end
end

#post_install()
#{
#mkdir -p /etc/gconf/gconf.xml.system/
#}
#""
