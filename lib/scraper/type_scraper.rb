require "nokogiri"
require_relative "../../spec/lib/model/type"
require_relative "../../spec/lib/model/property"

class TypeScraper
  # @param html [String]
  def initialize(html, url)
    @doc = Nokogiri::HTML _trip_hide(html)
    @url = url
  end

  def _trip_hide(html)
    html.gsub(/<code class="hidden_elem" id=".*"><!--/, '').gsub(" --></code>", "")
  end

  def scrape
    type = Type.new
    type.title = title
    type.description = description
    type.properties = property_tr.map { |tr|
      p = Property.new
      p.key = tr.css("._5m2a").text
      p.type = tr.css("._5nl8").text
      p.description = tr.css("._5nl9").text
      p
    }.reject {|p| p.key == ""}
    type
  end

  def property_tr
    @doc.css("tr")
  end

  def title
    @doc.css("#overview ._ohe._c24._50f4._50f7").text
  end

  def description
    @doc.css("#overview ._4-u3._3a8w").first.text
  end
end