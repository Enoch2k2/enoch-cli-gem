#Cli Controller

class BlizzardNews::Cli

  def call
    puts "Welcome to blizzard news CLI! Please choose a game:"
    self.class.list
  end

  def self.list
    puts "1. World of Warcraft. 2. Diablo III. 3. Starcraft II. Type list for list, exit to exit the program."
    self.get_input
  end

  def self.get_input
    input = gets.strip
    case input
      when "1"
        BlizzardNews.war_news_list
      when "2"
        BlizzardNews.diabloiii_news_list
      when "3"
        BlizzardNews.starcraftii_news_list
      when "exit"
        puts "Goodbye!"
      when "list"
        self.list
      else
        puts "Please try again"
        self.list
    end
  end

end