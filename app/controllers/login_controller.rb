class LoginController < ApplicationController

  def create
   @user = User.find_by(username: user_params[:username])
   puts user_params[:username]
   puts user_params
   if @user && @user.authenticate(user_params[:password])
     render json: { token: token(@user.id), user_id: @user.id, username: @user.username, address: @user.address }
   else
     render json: { error: "sorry, incorrect username or password." }, status: :unprocessable_entity
   end
 end

 private
 def user_params
   params.require(:user).permit(:username, :password)
 end
end
