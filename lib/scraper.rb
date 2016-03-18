require 'nokogiri'
require 'open-uri'
require 'pry'
class BlizzardNews::Scraper

  def self.scrape(url)
    doc = Nokogiri::HTML(open(url))
    @articles = [{},{},{},{},{},{},{},{},{},{},{}]

    doc.css('div#blog-articles').each do |x|
      x.css('span.article-title').each_with_index do |z, index|
        @articles[index][:name] = z.text.gsub("\n\t\t\t\t\t\t\t\t\t", "").gsub("\n\t\t\t\t\t\t\t\t", "")
       end
    end
    doc.css('div#blog-articles').each do |x|
      x.css('div.article-summary').each_with_index do |z, index|
        if z.text.include?("â\u0080\u0099")
          @articles[index][:description] = z.text.gsub("â\u0080\u0099","'")
        elsif z.text.include?("â\u0080\u0094")
          @articles[index][:description] = z.text.gsub("â\u0080\u0094"," ")
        else
          @articles[index][:description] = z.text
        end
      end
    end
    doc.css('div#blog-articles').each do |x|
      x.css('div.article-wrapper').each_with_index do |z, index|
      @articles[index][:url] = "us.battle.net#{z.css('a')[0]['href']}"
      end
    end
    @articles
  end

  def self.scrape_starcraft(url)
    doc = Nokogiri::HTML(open(url))
    @articles = [{},{},{},{},{},{},{},{},{},{},{}]

    doc.css('div.blog-articles').each do |x|
      x.css('span.article-title').each_with_index do |z, index|
        @articles[index][:name] = z.text.gsub("\n\t\t\t\t\t\t\t\t\t", "").gsub("\n\t\t\t\t\t\t\t\t", "")
       end
    end
    doc.css('div.blog-articles').each do |x|
      x.css('div.article-summary').each_with_index do |z, index|
        if z.text.include?("â\u0080\u0099")
          @articles[index][:description] = z.text.gsub("â\u0080\u0099","'")
        elsif z.text.include?("â\u0080\u0094")
          @articles[index][:description] = z.text.gsub("â\u0080\u0094"," ")
        else
          @articles[index][:description] = z.text
        end
      end
    end
    doc.css('div.blog-articles').each do |x|
      x.css('div.article-wrapper').each_with_index do |z, index|
      @articles[index][:url] = "us.battle.net#{z.css('a')[0]['href']}"
      end
    end
    @articles
  end

end

