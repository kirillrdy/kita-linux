package 'libxcb' do
  type :make
  source "http://xcb.freedesktop.org/dist/libxcb-1.7.tar.bz2"
  depends_on ['libXau','libXdmcp','libpthread-stubs','xcb-proto','libxslt']
end
