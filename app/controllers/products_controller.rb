class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :destroy]

  # GET /products
  def index
    if params["limit"]
      limit_number = params["limit"].to_i
      @products = Product.all[0..limit_number]
    else
      @products = Product.all[0..49]
    end

    render json: @products
  end

  # GET /products/1
  def show
    render json: @product
  end

  # POST /products
  def create
    @product = Product.new(product_params)

    if @product.save
      render json: @product, status: :created, location: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /products/1
  def update
    if @product.update(product_params)
      render json: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # DELETE /products/1
  def destroy
    @product.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def product_params
      params.require(:product).permit(:brand, :category_name, :coming_soon, :description, :description_of_deal, :display_name, :free_shipping, :image_extension, :student_deal, :item_code, :on_sale, :orig_product_id, :product_share_link, :product_size_chart, :list_price, :shipping_fee, :belongs_to)
    end
end
