require 'rubygems'
require 'open-uri'
require 'nokogiri'

comb_xslt = Nokogiri::XSLT(File.read("comb.xsl"))
comb = File.new('master.xml', 'w')
comb.write('<catalog>')
Dir.glob('*.xml') do |rb_file|
  xml = Nokogiri(File.read(rb_file))
  @doc = Nokogiri::XML(File.open(rb_file))
  comb.write(comb_xslt.transform(xml).to_html)
end 
comb.write('</catalog>')
comb.close