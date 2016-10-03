require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

  let(:valid_attributes) {
    { url: 'https://www.walmart.com/ip/Ematic-9-Dual-Screen-Portable-DVD-Player-with-Dual-DVD-Players-ED929D/28806789' }
  }

  let(:invalid_attributes) {
    { url: 'http://www.google.com' }
  }

  describe "GET #index" do
    it "assigns all products as @products" do
      product = create :product
      get :index, params: {}
      expect(assigns(:products)).to eq([product])
    end
  end

  describe "GET #show" do
    it "assigns the requested product as @product" do
      product = create :product
      get :show, params: {id: product.to_param}
      expect(assigns(:product)).to eq(product)
    end
  end

  describe "DELETE #destroy" do
    before(:each) { @product = create(:product) }

    it "destroys the requested product" do
      expect {
        delete :destroy, params: {id: @product.to_param}
      }.to change(Product, :count).by(-1)
    end

    it "redirects to the products list" do
      delete :destroy, params: {id: @product.to_param}
      expect(response).to redirect_to(products_url)
    end
  end

end
