require 'rails_helper'

RSpec.describe WalmartReviewUrlParser, type: :model do
  context 'valid_reviews_url' do
    before(:each) { @valid_parser = WalmartReviewUrlParser.new({url: 'https://www.walmart.com/reviews/product/28806789'}) }

    it "returns a correct first review title" do
      expect(@valid_parser.reviews_params[0][:title]).to eql('Great product so far!')
    end

    it "returns a correct first review username" do
      expect(@valid_parser.reviews_params[0][:username]).to eql('MamaG85')
    end

    it "returns a non-empty first review description" do
      expect(@valid_parser.reviews_params[0][:description]).not_to be_empty
    end

    it "returns a correct first review date" do
      expect(@valid_parser.reviews_params[0][:review_date]).to eql('12/15/2013')
    end
  end

  context 'invalid_review_url' do
    before(:each) { @valid_parser = WalmartReviewUrlParser.new({url: 'http://www.google.com'}) }

    it "returns an empty reviews params array" do
      expect(@valid_parser.reviews_params).to be_empty
    end

  end
end
