class TitleGrabber
  def self.find_title(url)
    parse_title(Nokogiri::HTML(open(url)))
  end

  def self.parse_title(page)
    page.search("title").text.gsub("\n", "").strip
  end
end
