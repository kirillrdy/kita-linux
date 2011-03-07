require 'open-uri'

# Helper function
def get_list_of_files url
  open(url).read.split("\n").select{|x| not (/^#/ === x) }
end



################################################################################
# XORG PROTO
xorg_proto_files = get_list_of_files 'http://anduin.linuxfromscratch.org/files/BLFS/svn/xorg/proto-7.6-1.wget'
xorg_proto_base_url = 'http://xorg.freedesktop.org/releases/individual/proto/'
xorg_proto_files.each do |file|
  package File.smart_basebname(file) do
    type :make
    source xorg_proto_base_url + file
  end
end

package 'xorg-proto' do
  type :meta
  depends_on xorg_proto_files.map{|x| File.smart_basename x }
  version '7.6-1'
end


################################################################################
# XORG UTIL
xorg_util_files = get_list_of_files 'http://anduin.linuxfromscratch.org/files/BLFS/svn/xorg/util-7.6-1.wget'
xorg_util_base_url = 'http://xorg.freedesktop.org/releases/individual/util/'

xorg_util_files.each do |file|
  package File.smart_basebname(file) do
    type :make
    source xorg_util_base_url + file
  end
end

package 'xorg-util' do
  type :meta
  version '7.6-1'
  depends_on xorg_util_files.map{|x| File.smart_basename x }
end


################################################################################
# XORG LIB
xorg_lib_files = get_list_of_files 'http://anduin.linuxfromscratch.org/files/BLFS/svn/xorg/lib-7.6-1.wget'
xorg_lib_base_url = 'http://xorg.freedesktop.org/releases/individual/lib/'

xorg_lib_files.each do |file|
  package File.smart_basename(file) do
    type :make
    source xorg_lib_base_url + file
  end
end

package 'xorg-lib' do
  type :meta
  depends_on ['fontconfig','xorg-proto','xorg-util','libXdmcp','libxcb'] + xorg_lib_files.map{|x| File.smart_basename x }
  version '7.6-1'
end

################################################################################
# XORG APP
xorg_app_files = get_list_of_files 'http://anduin.linuxfromscratch.org/files/BLFS/svn/xorg/app-7.6-1.wget'
xorg_app_base_url = 'http://xorg.freedesktop.org/releases/individual/app/'


xorg_app_files.each do |file|
  package File.smart_basebname(file) do
    type :make
    source xorg_app_base_url + file
  end
end

package 'xorg-app' do
  type :meta
  depends_on ['libpng','xcb-util','xorg-lib'] + xorg_app_files.map{|x| File.smart_basebname x }
  version '7.6-1'
end


#package 'xorg' do
#  type :meta
#  version '7.6'
#  depends_on 'xorg-server xorg-driver'
#end
