package 'linux' do

  type :make
  
  source 'http://www.kernel.org/pub/linux/kernel/v2.6/linux-2.6.37.2.tar.bz2'

  configure do
    '
    make mrproper
    make LANG=<host_LANG_value> LC_ALL= menuconfig
    '
  end

  build do
    '
    make
    make modules_install
    '
  end

  install do
    'cp -v arch/x86/boot/bzImage /boot/kernel-2.6.37'
  end

end
