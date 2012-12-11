require 'rubygems'
require 'open-uri'
require 'nokogiri'
 
xml = Nokogiri(File.read("nitf.xml"))
xml.encoding = 'UTF-8'
xslt = Nokogiri::XSLT(File.read("standard_article.xsl"))

puts xslt.transform(xml).to_html