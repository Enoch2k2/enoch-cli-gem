class BlizzardNews
  attr_accessor :name, :article_array

  def self.war_news_list
    puts "--------- World of Warcraft news ---------"
    articles = BlizzardNews::Scraper.scrape("http://us.battle.net/wow/en/")
    self.list_articles(articles)
    self.open_url(articles)
  end

  def self.diabloiii_news_list
    puts "--------- Diablo III news ---------"
    articles = BlizzardNews::Scraper.scrape("http://us.battle.net/d3/en/")
    self.list_articles(articles)
    self.open_url(articles)
  end

  def self.starcraftii_news_list
    puts "--------- Starcraft II news ---------"
    articles = BlizzardNews::Scraper.scrape_starcraft("http://us.battle.net/sc2/en/")
    self.list_articles(articles)
    self.open_url(articles)
  end

  def self.list_articles(articles)
    articles.each_with_index do |article, index|
      puts "#{index+1}. #{article.name} - #{article.description}"
    end
  end

  def self.open_url(articles)
    puts "----- Type: 1-11 to open article in browser. List for list of games, or exit to exit program. -----"
    input = gets.strip
    case input
      when "1"
        puts "paste in your browser: #{articles[0].url}"
        self.open_url(articles)
      when "2"
        puts "paste in your browser: #{articles[1].url}"
        self.open_url(articles)
      when "3"
        puts "paste in your browser: #{articles[2].url}"
        self.open_url(articles)
      when "4"
        puts "paste in your browser: #{articles[3].url}"
        self.open_url(articles)
      when "5"
        puts "paste in your browser: #{articles[4].url}"
        self.open_url(articles)
      when "6"
        puts "paste in your browser: #{articles[5].url}"
        self.open_url(articles)
      when "7"
        puts "paste in your browser: #{articles[6].url}"
        self.open_url(articles)
      when "8"
        puts "paste in your browser: #{articles[7].url}"
        self.open_url(articles)
      when "9"
        puts "paste in your browser: #{articles[8].url}"
        self.open_url(articles)
      when "10"
        puts "paste in your browser: #{articles[9].url}"
        self.open_url(articles)
      when "11"
        puts "paste in your browser: #{articles[10].url}"
        self.open_url(articles)
      when "list"
        BlizzardNews::Cli.list
      when "exit"
        puts "goodbye!"
      else
        puts "invalid option, please try again!"
        self.open_url(articles)
    end
  end

end