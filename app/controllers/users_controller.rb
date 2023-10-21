class UsersController < ApplicationController
  def show
    #user_id = params[:id]
    @user = User.find(params[:id])
    #binding.pry
  end

end
