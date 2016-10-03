require 'rails_helper'

RSpec.describe WalmartProductUrlParser, type: :model do
  context 'valid_product_url' do
    before(:each) { @valid_parser = WalmartProductUrlParser.new({url: 'https://www.walmart.com/ip/Ematic-9-Dual-Screen-Portable-DVD-Player-with-Dual-DVD-Players-ED929D/28806789'}) }

    it "is valid" do
      expect(@valid_parser.valid?).to be true
    end

    it "returns a correct name" do
      expect(@valid_parser.product_params[:name]).to eql('Ematic 9" Dual Screen Portable DVD Player with Dual DVD Players (ED929D)')
    end

    it "returns a correct price" do
      expect(@valid_parser.product_params[:price]).to eql(109.98)
    end

    it "returns a correct walmart_id" do
      expect(@valid_parser.product_params[:walmart_id]).to eql('551730595')
    end

    it "returns a correct product_id" do
      expect(@valid_parser.product_params[:product_id]).to eql('28806789')
    end
  end

  context 'invalid_product_url' do
    before(:each) { @valid_parser = WalmartProductUrlParser.new({url: 'http://www.google.com'}) }

    it "is invalid" do
      expect(@valid_parser.valid?).to be false
    end

    it "returns a nil name" do
      expect(@valid_parser.product_params[:name]).to eql(nil)
    end

    it "returns a nil price" do
      expect(@valid_parser.product_params[:price]).to eql(nil)
    end

    it "returns a nil walmart_id" do
      expect(@valid_parser.product_params[:walmart_id]).to eql(nil)
    end

    it "returns a nil product_id" do
      expect(@valid_parser.product_params[:product_id]).to eql(nil)
    end
  end
end
