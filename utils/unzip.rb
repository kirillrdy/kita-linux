package 'unzip' do
  type :make
  version '6.0'
  source 'http://downloads.sourceforge.net/infozip/unzip60.tar.gz'
  configure do
    ''
  end
  build do
    '
    case `uname -m` in
  i?86)
    make -f unix/Makefile linux
    ;;
  *)
    make -f unix/Makefile linux_noasm
    ;;
  esac
    '
  end
  install do
    'make prefix=/usr install'
  end
end
