class CartsController < ApplicationController
  before_action :set_cart, only: [:index, :show, :update, :destroy]
  before_action :require_login

  # GET /carts
  def index
    if @cart == []
      render json: { error: "this user doesn't have any product in a cart" }
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
    @cart = ProductsUser.new(cart_params)
    @product = Product.find(@cart.product_id)
    if @cart.save
      render json: @product, status: :created
    else
      render json: @cart.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /carts/1
  def update
    if @cart.update(cart_params)
      render json: @cart
    else
      render json: @cart.errors, status: :unprocessable_entity
    end
  end

  # DELETE /carts/1
  def destroy
    @cart.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = ProductsUser.where(user_id: current_user_id)
    end

    # Only allow a trusted parameter "white list" through.
    def cart_params
      params.require(:cart).permit(:user_id, :product_id)
    end
end
