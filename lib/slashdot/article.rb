# -*- coding: utf-8 -*-
require "nokogiri"
require "open-uri"
require "cgi"

module Slashdot
  class Article
    attr_reader :title, :body

    def get(url)
      doc = Nokogiri::HTML.parse(open(url).read)
      @title = get_title(doc)
      @body = get_body(doc)
    end

    private

    def get_title(doc)
      doc.css("h2.story > span > a").first.text
    end

    def get_body(doc)
      doc.css("div.body > div.p").first.inner_html.strip
    end
  end
end
