require 'rubygems'
require 'open-uri'
require 'nokogiri'

# Master file creation 
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

# ToC creation
toc_xml = Nokogiri(File.read('master.xml'))
toc_xslt = Nokogiri::XSLT(File.read("toc.xsl"))

toc = File.new('02_contents.html', 'w')

toc.write(toc_xslt.transform(toc_xml).to_html)
toc.close

# Article creation
Dir.glob('*.xml') do |rb_file|
  xml = Nokogiri(File.read(rb_file))
  @doc = Nokogiri::XML(File.open(rb_file))

  if @doc.xpath("//nitf/body/sections").text == "From the editors" ||
     @doc.xpath("//nitf/body/sections").text == "From the Editors"
    puts "working on: " + rb_file + " - editor template"
    xslt = Nokogiri::XSLT(File.read("editors_article.xsl"))
    file = File.new(rb_file.split(".").first + ".html", "w")
    file.write(xslt.transform(xml).to_html)
    file.close
  elsif @doc.xpath("//nitf/body/sections").text == "This week" && 
        @doc.xpath("//nitf/body/body.head/hedline").text == "Good News"
    puts "working on: " + rb_file + " - good news template"
      xslt = Nokogiri::XSLT(File.read("good_news.xsl"))
      file = File.new(rb_file.split(".").first + ".html", "w")
      file.write(xslt.transform(xml).to_html)
      file.close
  elsif @doc.xpath("//nitf/body/sections").text == "Letters"
    puts "working on: " + rb_file + " - letters template"
      xslt = Nokogiri::XSLT(File.read("letters.xsl"))
      file = File.new(rb_file.split(".").first + ".html", "w")
      file.write(xslt.transform(xml).to_html)
      file.close
    elsif @doc.xpath("//nitf/body/sections").text == "Interview"
       puts "working on: " + rb_file + " - interview template"
         xslt = Nokogiri::XSLT(File.read("interview.xsl"))
         file = File.new(rb_file.split(".").first + ".html", "w")
         file.write(xslt.transform(xml).to_html)
         file.close
  elsif @doc.xpath("//nitf/body/body.head/hedline").text == "Newsmakers"
    puts "working on: " + rb_file + " - newsmakers template"
      xslt = Nokogiri::XSLT(File.read("newsmakers.xsl"))
      file = File.new(rb_file.split(".").first + ".html", "w")
      file.write(xslt.transform(xml).to_html)
      file.close

      elsif @doc.xpath("//nitf/body/sections").text == "Masthead"
        puts "working on: " + rb_file + " - masthead template"
          xslt = Nokogiri::XSLT(File.read("masthead.xsl"))
          file = File.new(rb_file.split(".").first + ".html", "w")
          file.write(xslt.transform(xml).to_html)
          file.close

    elsif @doc.xpath("//nitf/body/sections").text == "Opinion"
      puts "working on: " + rb_file + " - opinion template"
        xslt = Nokogiri::XSLT(File.read("opinion.xsl"))
        file = File.new(rb_file.split(".").first + ".html", "w")
        file.write(xslt.transform(xml).to_html)
        file.close
      elsif @doc.xpath("//nitf/body/body.head/hedline").text == "Capital diary" ||
            @doc.xpath("//nitf/body/body.head").text.split(" ")[0..1].join == "CapitalDiary"

        puts "working on: " + rb_file + " - capital diary template"
          xslt = Nokogiri::XSLT(File.read("capitaldiary.xsl"))
          file = File.new(rb_file.split(".").first + ".html", "w")
          file.write(xslt.transform(xml).to_html)
          file.close
        elsif @doc.xpath("//nitf/body/sections").text == "Film" || 
              @doc.xpath("//nitf/body/sections").text == "Taste" ||
              @doc.xpath("//nitf/body/sections").text == "Bazaar" ||
              @doc.xpath("//nitf/body/sections").text == "Art" ||
              @doc.xpath("//nitf/body/sections").text == "Help" ||
              @doc.xpath("//nitf/body/sections").text == "Architecture" ||
              @doc.xpath("//nitf/body/sections").text == "Music" ||
              @doc.xpath("//nitf/body/sections").text == "Web" ||
              @doc.xpath("//nitf/body/sections").text == "Humour" ||
              @doc.xpath("//nitf/body/sections").text == "Media" ||
              @doc.xpath("//nitf/body/sections").text == "TV" ||
              @doc.xpath("//nitf/body/sections").text == "Radio" ||
              @doc.xpath("//nitf/body/sections").text == "Stage" ||
              @doc.xpath("//nitf/body/sections").text == "Exhibit" ||
              @doc.xpath("//nitf/body/sections").text == "Feschuk"
          puts "working on: " + rb_file + " - backpages template"
            xslt = Nokogiri::XSLT(File.read("backpages.xsl"))
            file = File.new(rb_file.split(".").first + ".html", "w")
            file.write(xslt.transform(xml).to_html)
            file.close
          elsif @doc.xpath("//nitf/body/sections").text == "Books"
            puts "working on: " + rb_file + " - books template"
              xslt = Nokogiri::XSLT(File.read("books.xsl"))
              file = File.new(rb_file.split(".").first + ".html", "w")
              file.write(xslt.transform(xml).to_html)
              file.close
  else 
    puts "working on: " + rb_file + " - standard"
    xslt = Nokogiri::XSLT(File.read("standard_article.xsl"))
    file = File.new(rb_file.split(".").first + ".html", "w")
    file.write(xslt.transform(xml).to_html)
    file.close
  end
end 
