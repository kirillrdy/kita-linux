package 'libgcrypt' do
  type :make
  source 'ftp://ftp.gnupg.org/gcrypt/libgcrypt/libgcrypt-1.4.6.tar.bz2'
  depends_on 'libgpg-error'
end
