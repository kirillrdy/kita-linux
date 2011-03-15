package 'openssl' do
  type :make
  source 'http://www.openssl.org/source/openssl-1.0.0b.tar.gz'
  configure do
  './config --prefix=/usr --openssldir=/etc/ssl shared zlib-dynamic'
  end
  build do
    'MAKEFLAGS=-j1 make'
  end
end
