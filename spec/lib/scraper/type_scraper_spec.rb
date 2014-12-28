require_relative "../../spec_helper"
require_relative "../../../lib/scraper/type_scraper"

describe TypeScraper do
  context("apps.save") do
    let(:html) { File.read(File.expand_path("../apps.saves.html", __FILE__)) }
    let(:scraper) { TypeScraper.new(html, "https://developers.facebook.com/docs/reference/opengraph/action-type/apps.saves/") }
    let(:type) { scraper.scrape }

    it { expect(type.title).to eq "apps.saves" }
    it { expect(type.description).to eq "An action representing someone saving an app to try later." }

    it { expect(type.properties.size > 10).to eq true }
    it { expect(type.properties.first.key).to eq "source_token" }
    it { expect(type.properties.first.type).to eq "String" }
    it { expect(type.properties.first.description).to eq "For internal use only" }
  end

  context("apps.save") do
    let(:html) { File.read(File.expand_path("../books.quotes.html", __FILE__)) }
    let(:scraper) { TypeScraper.new(html, "https://developers.facebook.com/docs/reference/opengraph/action-type/books.quotes/") }
    let(:type) { scraper.scrape }

    it { expect(type.title).to eq "books.quotes" }
    it { expect(type.description).to eq "An action representing someone quoting from a book." }

    it { expect(type.properties.size > 10).to eq true }
    it { expect(type.properties.first.key).to eq "body" }
    it { expect(type.properties.first.type).to eq "String" }
    it { expect(type.properties.first.description).to eq "The text of the quotation" }
  end

  context("video.episode") do
    let(:html) { File.read(File.expand_path("../video.episode.html", __FILE__)) }
    let(:scraper) { TypeScraper.new(html, "https://developers.facebook.com/docs/reference/opengraph/action-type/video.episode/") }
    let(:type) { scraper.scrape }

    it { expect(type.title).to eq "video.episode" }
    it { expect(type.description).to eq "This object type represents an episode of a TV show and contains references to the actors and other professionals involved in its production. An episode is defined by us as a full-length episode that is part of a series. This type must reference the series this it is part of." }

    it { expect(type.properties.size > 10).to eq true }
    it { expect(type.properties.first.key).to eq "video:actor" }
    it { expect(type.properties.first.type).to eq "Array<Struct>" }
    it { expect(type.properties.first.description).to eq "An actor in the episode" }
  end

  context("website") do
    let(:html) { File.read(File.expand_path("../website.html", __FILE__)) }
    let(:scraper) { TypeScraper.new(html, "https://developers.facebook.com/docs/reference/opengraph/action-type/website/") }
    let(:type) { scraper.scrape }

    it { expect(type.title).to eq "website" }
    it { expect(type.description).to eq "This object type represents a website. It is a simple object type and uses only common Open Graph properties. For specific pages within a website, the article object type should be used." }

    it { expect(type.properties.size > 10).to eq true }
    it { expect(type.properties.first.key).to eq "al:android" }
    it { expect(type.properties.first.type).to eq "Array<Struct>" }
    it { expect(type.properties.first.description).to eq "" }
  end
end