require_relative "lib/scraper/type_scraper"

require "pp"
require "json"

def parse(filepath)
  puts "Started to parse #{filepath}"

  html = File.read(filepath)
  url = "" # TODO
  scraper = TypeScraper.new(html, url)

  type = scraper.scrape
  pp type.to_yaml
rescue
  puts "Failed to parse #{filepath}"
end

Dir.glob("tmp/*") do |f|
  parse f
end