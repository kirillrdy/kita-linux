package 'cairo' do
  type :make
  source 'http://www.cairographics.org/releases/cairo-1.8.10.tar.gz'
  depends_on ['xorg','libpng','pixman','fontconfig']
end
