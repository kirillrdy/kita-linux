package 'cairo' do
  type :make
  source 'http://www.cairographics.org/releases/cairo-1.10.2.tar.gz'
  depends_on ['xorg','libpng','pixman','fontconfig']
end
