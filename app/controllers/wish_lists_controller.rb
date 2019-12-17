class WishListsController < ApplicationController
  before_action :set_wish_list, only: [:index, :show, :update, :destroy]

  # GET /wish_lists
  def index
    if @wish_list == []
      render json: []
    else
      render json: @wish_list
    end
  end

  # POST /wish_lists
  def create
    @wish_list = WishList.new(product_id: wish_list_params.values[0], user_id: current_user_id)

    if @wish_list.save
      render json: @wish_list, status: :created, location: @wish_list
    else
      render json: @wish_list.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /wish_lists/1
  def update
    if @wish_list.update(product_id: wish_list_params.values[0], user_id: current_user_id)
      render json: @wish_list
    else
      render json: @wish_list.errors, status: :unprocessable_entity
    end
  end

  # DELETE /wish_lists/1
  def destroy
    @wishlist = WishList.find_by(user_id: current_user_id, product_id: params[:id])
    @wishlist.destroy
    @new_wishlist = WishList.where(user_id: current_user_id)
    render json: @new_wishlist
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wish_list
      @wish_list = WishList.where(user_id: current_user_id)
    end

    # Only allow a trusted parameter "white list" through.
    def wish_list_params
      params.require(:wish_list).permit(:product_id)
    end
end
