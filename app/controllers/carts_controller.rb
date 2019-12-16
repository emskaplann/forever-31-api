class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :update, :destroy]
  before_action :require_login

  # GET /carts
  # def index
  #   @carts = ProductsUser.all
  #   byebug
  #   render json: @carts
  # end

  # GET /carts/1
  def show
    render json: @cart
  end

  # POST /carts
  def create
    @cart = ProductsUser.new(cart_params)

    if @cart.save
      render json: @cart, status: :created, location: @cart
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
      @cart = ProductsUser.find_by(user_id: params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cart_params
      params.require(:cart).permit(:user_id, :product_id)
    end
end
