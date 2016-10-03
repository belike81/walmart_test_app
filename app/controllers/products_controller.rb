class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :destroy]

  def index
    @products = Product.all
  end

  def create
    product = ProductCreator.new(product_params)
    if product.save
      redirect_to products_url, notice: 'Product was successfully added.'
    else
      redirect_to products_url, notice: 'Unable to add specified product to the DB.'
    end
  end

  def show
  end

  def destroy
    @product.destroy
    redirect_to products_url, notice: 'Product was successfully destroyed.'
  end

  private
  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.permit(:url)
  end
end
