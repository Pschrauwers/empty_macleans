require 'rubygems'
require 'open-uri'
require 'nokogiri'

toc_xml = Nokogiri(File.read('master.xml'))
toc_xslt = Nokogiri::XSLT(File.read("toc.xsl"))
toc = File.new('toc.html', 'w')
toc.write(toc_xslt.transform(toc_xml).to_html)
toc.close