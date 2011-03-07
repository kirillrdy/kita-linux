package 'xkeyboard-config' do
  type :make
  source 'http://xlibs.freedesktop.org/xkbdesc/xkeyboard-config-2.0.tar.bz2'
  depends_on ['intltool','xorg-app']
  configure do
    '
    ./configure --prefix=/usr --with-xkb-rules-symlink=xorg
    '
  end
end
