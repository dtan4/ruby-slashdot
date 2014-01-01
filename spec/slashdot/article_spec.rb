# -*- coding: utf-8 -*-
require "spec_helper"

module Slashdot
  describe Article do
    ARTICLE_URL = "http://slashdot.org/story/13/12/31/1437227"

    end

    describe "#get" do
      context "with valid URL" do
        before do
          stub_request(:get, ARTICLE_URL)
          .to_return(body: open(File.expand_path("../../fixtures/article", __FILE__)).read)
        end

        subject { Slashdot::Article.new.get(ARTICLE_URL) }

        it "should return self" do
          expect(subject).to be_kind_of Slashdot::Article
        end

        it "should get id" do
          expect(subject.id).to eq 54845787
        end

        it "should get title" do
          expect(subject.title).to eq "How Machine Learning Can Transform Online Dating"
        end

        it "should get author" do
          expect(subject.author).to eq "timothy"
        end

        it "should get postdate" do
          expect(subject.postdate).to eq Time.parse("on Tuesday December 31, 2013 @09:37AM")
        end

        it "should get department" do
          expect(subject.department).to eq "the it-can-please-hurry-up-while-I'm-in-my-30s dept."
        end

        it "should get url" do
          expect(subject.url).to eq "http://slashdot.org/story/13/12/31/1437227/how-machine-learning-can-transform-online-dating"
        end

        it "should get body" do
          expect(subject.body).to eq <<-EOS.strip
First time accepted submitter hrb1979 writes <i>"Thought I'd share <a href="http://www.datascienceweekly.org/blog/7-how-machine-learning-can-transform-online-dating-kang-zhao-interview">an interview</a> with <a href="http://tippie.uiowa.edu/people/profile/profile.aspx?id=1250744">Kang Zhao</a> — the professor behind the machine learning algorithm which could transform online dating. His algorithm takes into account both a user's tastes (in an approach similar to the Netflix recommendation engine) and their attractiveness (by analyzing how many responses they get) — enabling the machine to 'learn' and hence propose higher potential matches. His research was recently covered in both <a href="http://www.forbes.com/sites/daviddisalvo/2013/12/07/why-the-future-of-online-dating-relies-on-ignoring-you">a Forbes' article</a> and the <a href="http://www.technologyreview.com/view/521826/the-online-dating-engine-that-assesses-your-taste-in-the-opposite-sex-and-whether-they">MIT Technology Review</a>, though this interview provides more depth and color."</i>
          EOS
        end
      end

      context "with invalid URL" do

      end
    end
  end
end
