package 'freetype' do
  type :make
  source "http://downloads.sourceforge.net/freetype/freetype-2.4.4.tar.bz2"

  configure do
    <<-EOF
    sed -i -r -e 's:.*(#.*BYTE.*) .*:\1:' -e 's:.*(#.*SUBPIX.*) .*:\1:' include/freetype/config/ftoption.h &&
    ./configure --prefix=/usr
    EOF
  end
end
