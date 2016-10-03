require 'rails_helper'

RSpec.describe "products/new", type: :view do
  before(:each) do
    assign(:product, Product.new(
      :walmart_id => 1,
      :name => "MyString",
      :price => "9.99",
      :url => "MyString"
    ))
  end

  it "renders new product form" do
    render

    assert_select "form[action=?][method=?]", products_path, "post" do

      assert_select "input#product_walmart_id[name=?]", "product[walmart_id]"

      assert_select "input#product_name[name=?]", "product[name]"

      assert_select "input#product_price[name=?]", "product[price]"

      assert_select "input#product_url[name=?]", "product[url]"
    end
  end
end
