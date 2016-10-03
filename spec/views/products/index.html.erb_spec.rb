require 'rails_helper'

RSpec.describe "products/index", type: :view do
  before(:each) do
    assign(:products, [
      Product.create!(
        :walmart_id => 2,
        :name => "Name",
        :price => "9.99",
        :url => "Url"
      ),
      Product.create!(
        :walmart_id => 2,
        :name => "Name",
        :price => "9.99",
        :url => "Url"
      )
    ])
  end

  it "renders a list of products" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
  end
end
