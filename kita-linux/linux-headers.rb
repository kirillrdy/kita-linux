package 'linux' do

  type :make
  
  source 'http://www.kernel.org/pub/linux/kernel/v2.6/linux-2.6.37.2.tar.bz2'

  configure do
    '
    '
  end

  build do
    '
    make mrproper
    make headers_check
    '
  end

  install do
  '
    make INSTALL_HDR_PATH=dest headers_install
    cp -rv dest/include/* /usr/include
  '
  end

end
