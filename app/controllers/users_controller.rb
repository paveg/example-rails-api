class UsersController < ApplicationController

  def show
    render json: UserSerializer.new(user)
  end

  def user
    @user ||= User.find(params[:id])
  end

end
