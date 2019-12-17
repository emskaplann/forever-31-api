class CartsController < ApplicationController
  before_action :set_cart, only: [:index, :show]
  before_action :set_cart_for_update, only: [:update]
  before_action :require_login

  # GET /carts
  def index
    if @cart == []
      render json: []
    else
      render json: @cart
    end
  end

  # GET /carts/1
  # def show
  #   render json: @cart
  # end

  # POST /carts
  def create
    @cart = ProductsUser.new(product_id: cart_params.values[0], user_id: current_user_id, quantity: 1)
    @product = Product.find(@cart.product_id)
    if @cart.save
      render json: {product: @cart.product, product_images: @cart.product.product_images, quantity: @cart.quantity}, status: :created
    else
      render json: @cart.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /carts/1
  def update
    byebug
    if @cart.update(quantity: @cart[0].quantity + 1)
      render json: @cart
    else
      render json: @cart.errors, status: :unprocessable_entity
    end
  end

  # DELETE /carts/1
  def destroy
    @cart = ProductsUser.find_by(user_id: current_user_id, product_id: params[:id])
    @cart.destroy
    @new_cart = ProductsUser.where(user_id: current_user_id)
    render json: @new_cart
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = ProductsUser.where(user_id: current_user_id)
    end

    def set_cart_for_update
      @cart = ProductsUser.where(product_id: params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cart_params
      params.require(:cart).permit(:product_id)
    end
end
