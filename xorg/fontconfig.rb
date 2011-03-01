package 'fontconfig' do
  type :make
  source 'http://fontconfig.org/release/fontconfig-2.8.0.tar.gz'
  depends_on ['freetype','libxml2']
  configure do
    './configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --disable-docs --without-add-fonts'
  end
  install do
    'make install
    
    #TODO move to post install
    fc-cache'
  end

end
