require 'open-uri'

# Helper functions
def get_list_of_modules url
  open(url).read.split("\n").select{|x| not (/^#/ === x) }.map{|x| File.smart_basename x }
end



################################################################################
# XORG PROTO
xorg_proto_modules = get_list_of_modules 'http://anduin.linuxfromscratch.org/files/BLFS/svn/xorg/proto-7.6-1.wget'

xorg_proto_modules.each do |mod|
  package mod do
    type :make
  end
end

package 'xorg-proto' do
  type :meta
  depends_on xorg_proto_modules
  version '7.6-1'
end


################################################################################
# XORG UTIL
xorg_util_modules = get_list_of_modules 'http://anduin.linuxfromscratch.org/files/BLFS/svn/xorg/util-7.6-1.wget'

xorg_util_modules.each do |mod|
  package mod do
    type :make
  end
end

package 'xorg-util' do
  type :meta
  version '7.6-1'
  depends_on xorg_util_modules
end


################################################################################
# XORG LIB
xorg_lib_modules = get_list_of_modules 'http://anduin.linuxfromscratch.org/files/BLFS/svn/xorg/lib-7.6-1.wget'

xorg_lib_modules.each do |mod|
  package mod do
    type :make
  end
end

package 'xorg-lib' do
  type :meta
  depends_on ['fontconfig','xorg-proto','xorg-util','libXdmcp','libxcb'] + xorg_lib_modules
  version '7.6-1'
end

################################################################################
# XORG APP
xorg_app_modules = get_list_of_modules 'http://anduin.linuxfromscratch.org/files/BLFS/svn/xorg/app-7.6-1.wget'

xorg_app_modules.each do |mod|
  package mod do
    type :make
  end
end

package 'xorg-app' do
  type :meta
  depends_on ['libpng','xcb-util','xorg-lib'] + xorg_app_modules
  version '7.6-1'
end


#package 'xorg' do
#  type :meta
#  version '7.6'
#  depends_on 'xorg-server xorg-driver'
#end
