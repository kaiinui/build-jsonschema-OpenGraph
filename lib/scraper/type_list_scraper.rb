require "nokogiri"
require "uri"

BASE_URI = "https://developers.facebook.com/"

class TypeListScraper
  # @param html [String]
  def initialize(html)
    @doc = Nokogiri::HTML(_trip_hide(html))
  end

  def _trip_hide(html)
    html.gsub(/<code class="hidden_elem" id=".*"><!--/, '').gsub(" --></code>", "")
  end

  # @return [Array<String>] A list of URL
  def scrape
    @doc.css("table tbody").flat_map { |t|
      t.css("tr").map do |tr|
        path = tr.css("td")[0].css("a").first["href"]
        URI.join(BASE_URI, path).to_s
      end
    }
  end
end