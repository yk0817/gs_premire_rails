require "#{Dir.pwd}/ruby_test/common"

class Crawl
  def initialize(url)
    @school_url = url
  end

  def contents
    headlines_links.each_with_index do |url, count|
      next if url.match(/qiita/)
      next unless url.include?('html')
      p "#{count + 1}番目の記事"
      p parse_article(url)
      sleep 1
    end
  end

  private

    def parse_article(url)
      doc = open_html(url)
      doc.css('#contents').text
    end

    def headlines_links
      headlines_links = Array.new
      top_doc = open_html(@school_url)
      top_doc.css('article .item').each do |article|
        headlines_links << article.css("a").first[:href]
      end
      headlines_links
    end

    def open_html(url)
      html = open(url) do |f|
        f.read
      end
      Nokogiri::HTML.parse(html, nil, 'UTF-8')
    end
end

@crawl = Crawl.new("https://gsacademy.tokyo/")
@crawl.contents
