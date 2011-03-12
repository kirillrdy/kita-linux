package 'xorg-server' do
  type :make
  source 'http://xorg.freedesktop.org/releases/individual/xserver/xorg-server-1.9.3.tar.bz2'
  depends_on ['openssl','pixman','xorg-font','xkeyboard-config']
  configure do
  '
    ./configure --prefix=/usr \
    --with-module-dir=/usr/lib/X11/modules \
    --with-xkb-output=/var/lib/xkb \
    --enable-install-setuid \
    --disable-config-hal
  '
  end
end

#BUILD=""
#config_src()
#{
#./configure --prefix=/usr --sysconfdir=/etc --mandir=/usr/share/man --localstatedir=/var \
#    --with-module-dir=/usr/lib/X11/modules \
#    --with-xkb-output=/var/lib/xkb \
#    --enable-install-setuid
#}
#post_install()
#{
#rm -rf /etc/X11
#ln -vsf /usr /usr/X11R6
#mkdir -p /etc/X11
#for file in /usr/{lib/X11/xinit,share/X11/{app-defaults,twm,xkb}}
#do
#     echo $file
#     mv -vf $file /etc/X11/ 2> /dev/null &&
#     ln -fv -fs /etc/X11/$(basename $file) $file
#done
#}
#""
