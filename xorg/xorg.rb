require 'open-uri'

# Helper function
def get_list_of_files url
  open(url).read.split("\n").select{|x| not (/^#/ === x) }
end


def xorg_module module_name, xorg_version , additional_dependencies = []

  xorg_files = get_list_of_files "http://anduin.linuxfromscratch.org/files/BLFS/svn/xorg/#{module_name}-#{xorg_version}.wget"
  xorg_base_url = "http://xorg.freedesktop.org/releases/individual/#{module_name}/"
  xorg_files.each do |file|
    package File.smart_basename(file) do
      type :make
      source xorg_base_url + file
    end
  end

  package "xorg-#{module_name}" do
    type :meta
    depends_on additional_dependencies + xorg_proto_files.map{|x| File.smart_basename x }
    version xorg_version
  end

end


################################################################################
# XORG PROTO
xorg_module 'proto','7.6-1'
xorg_module 'util','7.6-1'
xorg_module 'lib','7.6-1', ['fontconfig','xorg-proto','xorg-util','libXdmcp','libxcb']
xorg_module 'app','7.6-1', ['libpng','xcb-util','xorg-lib','mesalib']



#package 'xorg' do
#  type :meta
#  version '7.6'
#  depends_on 'xorg-server xorg-driver'
#end
