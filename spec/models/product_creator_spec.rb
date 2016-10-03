require 'rails_helper'

RSpec.describe ProductCreator, type: :model do
  it "creates a product given a valid url was given" do
    valid_url = { url: 'https://www.walmart.com/ip/Ematic-9-Dual-Screen-Portable-DVD-Player-with-Dual-DVD-Players-ED929D/28806789' }
    creator = ProductCreator.new(valid_url)
    expect { creator.save }.to change(Product, :count).by(1)
  end

  context 'invalid url provided' do
    it "does not save a product when invalid url is provided" do
      invalid_url = { url: 'https://www.google.com' }
      creator = ProductCreator.new(invalid_url)
      expect { creator.save }.not_to change(Product, :count)
    end

    it "has errors array filled when url was invalid" do
      invalid_url = { url: 'https://www.google.com' }
      creator = ProductCreator.new(invalid_url)
      creator.save
      expect(creator.errors).not_to be_empty
    end
  end
end
