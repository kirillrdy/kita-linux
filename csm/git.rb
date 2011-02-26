package 'git' do

  type :make
  source "http://kernel.org/pub/software/scm/git/git-1.7.4.1.tar.bz2"

  # TODO fix this patch, colors should be on by default
  #patch  "http://files.kita-linux.org/patches/git-colorful.patch"

end
