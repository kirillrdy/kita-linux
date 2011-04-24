package 'nss' do
  type :make
  source 'http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_3_12_8_RTM/src/nss-3.12.8.tar.gz'
  patch 'http://www.linuxfromscratch.org/patches/blfs/svn/nss-3.12.8-standalone-1.patch'
  
  depends_on 'nspr'
  
  configure do
    ''
  end
  
  build do
    <<-EOS
export BUILD_OPT=1
export NSS_USE_SYSTEM_SQLITE=1
export NSPR_INCLUDE_DIR=/usr/include/nspr
export USE_SYSTEM_ZLIB=1
export ZLIB_LIBS=-lz
make -C mozilla/security/nss nss_build_all
    EOS
  end
  
  install do
    <<-EOS
export NSS_LINUXDIR=$(basename `ls -d $PWD/mozilla/dist/Linux*`)
cd mozilla/dist
install -v -m755 $NSS_LINUXDIR/lib/*.so /usr/lib
install -v -m644 $NSS_LINUXDIR/lib/{*.chk,libcrmf.a} /usr/lib
install -v -m755 -d /usr/include/nss
install -v -m755 $NSS_LINUXDIR/bin/{certutil,nss-config,pk12util} /usr/bin
install -v -m644 $NSS_LINUXDIR/lib/pkgconfig/nss.pc /usr/lib/pkgconfig
cp -v -RL {public,private}/nss/* /usr/include/nss
chmod 644 /usr/include/nss/*

    EOS
  end
  
end
