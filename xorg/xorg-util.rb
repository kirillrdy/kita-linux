require 'open-uri'

def get_list_of_modules url
  open(url).read.split("\n").select{|x| not (/^#/ === x) }.map{|x| File.smart_basename x }
end

list_of_modules = get_list_of_modules 'http://anduin.linuxfromscratch.org/files/BLFS/svn/xorg/util-7.6-1.wget'


list_of_modules.each do |mod|
  package mod do
    type :make
  end
end

package 'xorg-util' do
  type :meta
  version '7.6-1'
  depends_on list_of_modules
end
