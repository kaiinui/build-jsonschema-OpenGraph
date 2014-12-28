require "open-uri"
require_relative "lib/scraper/type_list_scraper"

LIST_URI = "https://developers.facebook.com/docs/reference/opengraph".freeze

def save_url(url)
  filename = url.split("/").last # https://developers.facebook.com/docs/reference/opengraph/action-type/apps.saves/ -> apps.saves
  File.open("tmp/#{filename}", "w") do |f|
    f.write open(url).read
  end
rescue
  puts "Failed to save #{url}"
end

"Started to fetch #{LIST_URI}"
html = open(LIST_URI).read
scraper = TypeListScraper.new(html)
list = scraper.scrape
list.each do |url|
  puts "Started to fetch #{url}"

  save_url url
end