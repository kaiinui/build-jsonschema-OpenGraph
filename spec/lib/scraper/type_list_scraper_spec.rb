require_relative "../../spec_helper"
require_relative "../../../lib/scraper/type_list_scraper"

describe TypeListScraper do
  let(:html) { File.read(File.expand_path("../TypeList.html", __FILE__)) }
  let(:scraper) { TypeListScraper.new(html) }
  let(:list) { scraper.scrape }

  it { expect(list.first).to eq "https://developers.facebook.com/docs/reference/opengraph/action-type/apps.saves/" }
  it { expect(list.length > 10).to eq true }
end