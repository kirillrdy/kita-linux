package 'XML-Parser' do
  type :make
  source 'http://www.cpan.org/authors/id/C/CH/CHORNY/XML-Parser-2.40.tar.gz'
  depends_on 'perl'
  configure do
    ''
  end

  build do
    'perl Makefile.PL && make'
  end

end
