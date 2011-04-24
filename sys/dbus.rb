package 'dbus' do
  type :make
  source 'http://dbus.freedesktop.org/releases/dbus/dbus-1.3.0.tar.gz'
  depends_on 'libxml2'
  configure do
  <<-EOS
  groupadd -fg 18 messagebus &&
useradd -c "D-BUS Message Daemon User" -d /dev/null \
        -u 18 -g messagebus -s /bin/false messagebus || [ $? == 9 ]

./configure --prefix=/usr \
            --sysconfdir=/etc \
            --libexecdir=/usr/lib/dbus-1.0  \
            --localstatedir=/var


  EOS
  end
  post_install do
  <<-EOS
cat > /etc/dbus-1/session-local.conf <<"EOF"
<!DOCTYPE busconfig PUBLIC
 "-//freedesktop//DTD D-BUS Bus Configuration 1.0//EN"
 "http://www.freedesktop.org/standards/dbus/1.0/busconfig.dtd">
<busconfig>

  <!-- Search for .service files in /usr/local -->
  <servicedir>/usr/local/share/dbus-1/services</servicedir>

</busconfig>
EOF
  EOS
  end
end
