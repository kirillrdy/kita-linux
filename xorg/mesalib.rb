package 'libmesa' do
  type :make
  source 'ftp://ftp.freedesktop.org/pub/mesa/7.9/MesaLib-7.9.tar.bz2'
  depends_on ['xorg-lib','xorg-util','libdrm','expat','talloc']
  configure do
    '
    ./configure --prefix=/usr --enable-xcb 
    '
  end
end
