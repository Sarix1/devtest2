require 'nokogiri'
require 'open-uri'
require 'json'

class Scraper
  def scrape(url)
    Nokogiri::HTML(open(url))
  end

  def visible_text(doc)
    doc.xpath('//script')&.remove
    doc.xpath('//style')&.remove
    doc.xpath('//text()').map(&:text).join(' ').squish

    doc.text
  end
  
  def count_characters(url, char)
    doc = scrape(url)
    text = visible_text(doc)

    text.count char
  end

  def count_html_nodes(url)
    doc = scrape(url)

    doc.search('*').length  
  end

  def count_arrays(url, min_array_size)
		result = 0
    doc = JSON.parse(open(url).read)
    
		doc["docs"].each do |i|
			i.values.each do |x|
				if x.class == Array
					if x.length > min_array_size
						result += 1
					end
				end
			end
    end
    
		result
  end
end