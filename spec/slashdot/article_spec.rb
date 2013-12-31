# -*- coding: utf-8 -*-
require "spec_helper"

module Slashdot
  describe Article do
    ARTICLE_URL = "http://slashdot.org/story/13/12/31/1437227"

    before do
      stub_request(:get, ARTICLE_URL)
        .to_return(body: open(File.expand_path("../../fixtures/article", __FILE__)).read)
    end

    describe "#get" do
      let(:article) { Slashdot::Article.new }

      context "with valid URL" do
        before { article.get(ARTICLE_URL) }

        it "should get title" do
          expect(article.title).to eq "How Machine Learning Can Transform Online Dating"
        end

        it "should get body" do
          expect(article.body).to eq <<-EOS.strip
First time accepted submitter hrb1979 writes <i>"Thought I'd share <a href="http://www.datascienceweekly.org/blog/7-how-machine-learning-can-transform-online-dating-kang-zhao-interview">an interview</a> with <a href="http://tippie.uiowa.edu/people/profile/profile.aspx?id=1250744">Kang Zhao</a> — the professor behind the machine learning algorithm which could transform online dating. His algorithm takes into account both a user's tastes (in an approach similar to the Netflix recommendation engine) and their attractiveness (by analyzing how many responses they get) — enabling the machine to 'learn' and hence propose higher potential matches. His research was recently covered in both <a href="http://www.forbes.com/sites/daviddisalvo/2013/12/07/why-the-future-of-online-dating-relies-on-ignoring-you">a Forbes' article</a> and the <a href="http://www.technologyreview.com/view/521826/the-online-dating-engine-that-assesses-your-taste-in-the-opposite-sex-and-whether-they">MIT Technology Review</a>, though this interview provides more depth and color."</i>
          EOS
        end
      end

      context "with invalid URL" do

      end
    end
  end
end
