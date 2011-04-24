package 'nspr' do
  type :make
  source 'http://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v4.8.6/src/nspr-4.8.6.tar.gz'
  patch 'http://www.linuxfromscratch.org/patches/blfs/svn/nspr-4.8.6-pkgconfig-1.patch'
  
  configure do
  '
  cd mozilla/nsprpub &&
./configure --prefix=/usr \
            --with-mozilla \
            --with-pthreads
  '
  end
  install do
    '
    make install &&
cp -v -LR dist/include/nspr /usr/include &&
rm -v -f /usr/bin/{prerr.properties,compile-et.pl}
    '
  end
  
end
