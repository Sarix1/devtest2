class Calculator
  def calculate(panel_provider_id)
    scraper = Scraper.new

    if panel_provider_id == 1
      scraper.count_characters("https://time.com/", "a") / 100

    elsif panel_provider_id == 2
      scraper.count_arrays("https://openlibrary.org/search.json?q=the+lord+of+the+rings", 10)

    elsif panel_provider_id == 3
      scraper.count_html_nodes("https://time.com/") / 100

    end
  end
end
