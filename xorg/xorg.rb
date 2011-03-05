require 'open-uri'

# Helper functions
def get_list_of_modules url
  open(url).read.split("\n").select{|x| not (/^#/ === x) }.map{|x| File.smart_basename x }
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
# XORG PROTO
xorg_proto_modules = get_list_of_modules 'http://anduin.linuxfromscratch.org/files/BLFS/svn/xorg/proto-7.6-1.wget'

xorg_proto_modules.each do |mod|
  package mod do
    type :make
  end
end

package 'xorg-proto' do
  type :meta
  depends_on ['xorg-util'] + xorg_proto_modules
  version '7.6-1'
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
  depends_on ['xorg-proto','fontconfig','libXdmcp'] + xorg_lib_modules
  version '7.6-1'
end


#package 'xorg' do
#  type :meta
#  version '7.6'
#  depends_on 'xorg-server xorg-driver'
#end
