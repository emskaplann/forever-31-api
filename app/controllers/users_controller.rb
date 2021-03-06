class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  before_action :require_login, only: [:show, :update, :destroy]


  # GET /users
  def index
    @user_names = User.all.map { |user|
      user.username
    }

    render json: @user_names
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    # byebug
    @user = User.new(user_params)
    # Address.new(user_id: @user.id, line_1: "81 Prospect St", line_2: "Brooklyn, NY 11201")

    if @user.save
      render json: { token: token(@user.id), user_id: @user.id, username: @user.username }
    else
      render json: { errors: @user.errors }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation)
    end
end
