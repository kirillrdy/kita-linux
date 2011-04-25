package 'zip' do
  type :make
  version '3.0'
  source 'ftp://ftp.info-zip.org/pub/infozip/src/zip30.tgz'
  configure do
    ''
  end

  build do
   'make -f unix/Makefile generic_gcc'
  end
  
  install do
    'make prefix=/usr -f unix/Makefile install'
  end
  
end
