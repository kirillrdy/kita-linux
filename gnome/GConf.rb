package 'GConf' do
  type :make
  depends_on 'ORBit2 libxml2 gtk+ polkit'
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
