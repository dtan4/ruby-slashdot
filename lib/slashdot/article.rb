# -*- coding: utf-8 -*-
require "nokogiri"
require "open-uri"

module Slashdot
  class Article
    attr_reader :id, :title, :author, :postdate, :department, :url, :body

    def initialize(args = {})
      @id = args[:id] || 0
      @title = args[:title] || ""
      @author = args[:author] || ""
      @postdate = args[:postdate] || nil
      @department = args[:department] || ""
      @url = args[:url] || ""
      @body = args[:body] || ""
    end

    def get(url)
      doc = Nokogiri::HTML.parse(open(url).read)
      @id = get_id(doc)
      @title = get_title(doc)
      @author = get_author(doc)
      @postdate = get_postdate(doc)
      @department = get_department(doc)
      @url = get_url(doc)
      @body = get_body(doc)
      self
    end

    private

    def get_id(doc)
      doc.css("article").attr("data-fhid").value.to_i
    end

    def get_title(doc)
      doc.css("h2.story > span > a").first.text
    end

    def get_author(doc)
      doc.css("header div.details > a").text
    end

    def get_postdate(doc)
      Time.parse(doc.css('time').attr("datetime").value)
    end

    def get_department(doc)
      doc.css("header div.details").text.strip[/from ([\w\W]+ dept\.)$/, 1]
    end

    def get_url(doc)
      "http:" << doc.css("h2.story > span > a").attr("href").value
    end

    def get_body(doc)
      doc.css("div.body > div.p").first.inner_html.strip
    end
  end
end
