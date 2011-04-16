package 'xterm' do
  type :make
  source 'ftp://invisible-island.net/xterm/xterm-267.tgz'
  depends_on 'xorg-app'
  configure do
    <<-EOS
    sed -i '/v0/,+1s/new:/new:kb=^?:/' termcap &&
echo -e '\tkbs=\\177,' >>terminfo &&
TERMINFO=/usr/lib/terminfo ./configure --prefix=/usr \
    --enable-luit --enable-wide-chars \
    --with-app-defaults=/etc/X11/app-defaults
    EOS
  end
  install do
    <<-EOS
    make install
cat >> /etc/X11/app-defaults/XTerm << "EOF"
*VT100*locale: true
*VT100*faceName: Monospace
*VT100*faceSize: 10
*backarrowKeyIsErase: true
*ptyInitialErase: true
EOF
    EOS
  end
end
