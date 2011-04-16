package 'polkit' do
  type :make
  source 'http://hal.freedesktop.org/releases/polkit-0.100.tar.gz'
  #depends_on 'Linux-PAM' #TODO this is for lfs build polkit, with gentoo stage we dont need this
  depends_on 'gobject-introspection'
  configure do
    <<-EOS
      groupadd -f -g 28 polkituser

      if [ `id -u polkituser` = '28' ]; then
        echo "Polkit user already exists"
      else
        useradd -c "Policy Kit Daemon User" -d /dev/null -u 28 -g polkituser -s /bin/false polkituser
      fi

      ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib/polkit-1 --localstatedir=/var
    EOS
  end
end
