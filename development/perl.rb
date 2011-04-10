package 'perl' do
  type :make
  source 'http://cpan.org/src/perl-5.10.1.tar.bz2'
  configure {''}
  build do
  <<-EOF
    echo "127.0.0.1 localhost $(hostname)" > /etc/hosts

    sed -i -e "s|BUILD_ZLIB\s*= True|BUILD_ZLIB = False|"           \
           -e "s|INCLUDE\s*= ./zlib-src|INCLUDE    = /usr/include|" \
           -e "s|LIB\s*= ./zlib-src|LIB        = /usr/lib|"         \
        ext/Compress-Raw-Zlib/config.in


    sh Configure -des -Dprefix=/usr \
                      -Dvendorprefix=/usr           \
                      -Dman1dir=/usr/share/man/man1 \
                      -Dman3dir=/usr/share/man/man3 \
                      -Dpager="/usr/bin/less -isR"
    make
  EOF
  end
end
