class BlizzardNews::Scraper

  def self.scrape(url)
    doc = Nokogiri::HTML(open(url))
    @articles = []

      doc.css('div.article-wrapper').each_with_index do |z, index|
        if index >= 3
          article = BlizzardNews::Article.new
          article.name = z.css('span.article-title')[0].text.gsub("\n\t\t\t\t\t\t\t\t\t", "").gsub("\n\t\t\t\t\t\t\t\t", "")
          article.description = z.css('div.article-summary').text.gsub("â\u0080\u0099","'").gsub("â\u0080\u0094"," ")
          article.url = "us.battle.net#{z.css('a')[0]['href']}"
          @articles << article
        end
      end

    @articles
  end

  def self.scrape_starcraft(url)
    doc = Nokogiri::HTML(open(url))
    @articles = []

      doc.css('div.article-wrapper').each_with_index do |z, index|
          article = BlizzardNews::Article.new
          article.name = z.css('span.article-title')[0].text.gsub("\n\t\t\t\t\t\t\t\t\t", "").gsub("\n\t\t\t\t\t\t\t\t", "")
          article.description = z.css('div.article-summary').text.gsub("â\u0080\u0099","'").gsub("â\u0080\u0094"," ")
          article.url = "us.battle.net#{z.css('a')[0]['href']}"
          @articles << article
      end

    @articles
  end

end