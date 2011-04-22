package 'docbook-xsl' do
  type :make
  source 'http://downloads.sourceforge.net/docbook/docbook-xsl-1.76.1.tar.bz2'
  depends_on 'libxml2'
  configure do
    ''
  end
  build do
    ''
  end
  install do
    <<-EOS
install -v -m755 -d /usr/share/xml/docbook/xsl-stylesheets-1.76.1 &&

cp -v -R VERSION common eclipse epub extensions fo highlighting html \
         htmlhelp images javahelp lib manpages params profiling \
         roundtrip slides template tests tools webhelp website \
         xhtml xhtml-1_1 \
    /usr/share/xml/docbook/xsl-stylesheets-1.76.1 &&

install -v -m644 -D README \
                    /usr/share/doc/docbook-xsl-1.76.1/README.XSL &&
install -v -m755    RELEASE-NOTES* NEWS* \
                    /usr/share/doc/docbook-xsl-1.76.1

# Config section
if [ ! -d /etc/xml ]; then install -v -m755 -d /etc/xml; fi &&
if [ ! -f /etc/xml/catalog ]; then
    xmlcatalog --noout --create /etc/xml/catalog
fi &&

xmlcatalog --noout --add "rewriteSystem" \
           "http://docbook.sourceforge.net/release/xsl/1.76.1" \
           "/usr/share/xml/docbook/xsl-stylesheets-1.76.1" \
    /etc/xml/catalog &&

xmlcatalog --noout --add "rewriteURI" \
           "http://docbook.sourceforge.net/release/xsl/1.76.1" \
           "/usr/share/xml/docbook/xsl-stylesheets-1.76.1" \
    /etc/xml/catalog &&

xmlcatalog --noout --add "rewriteSystem" \
           "http://docbook.sourceforge.net/release/xsl/current" \
           "/usr/share/xml/docbook/xsl-stylesheets-1.76.1" \
    /etc/xml/catalog &&

xmlcatalog --noout --add "rewriteURI" \
           "http://docbook.sourceforge.net/release/xsl/current" \
           "/usr/share/xml/docbook/xsl-stylesheets-1.76.1" \
    /etc/xml/catalog

    EOS
  end
end
