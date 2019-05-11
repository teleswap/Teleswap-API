class Api::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  #Sign up new user
  def create
    @user = User.new(user_params)
    if @user.save
      render :ok, json: @user.to_json
    else
      @errors = @user.errors.full_messages
      render json: { message: @errors }, status: :unauthorized
    end
  end


  private
  def user_params
    params.permit(:email, :username, :password, :image_url)
  end

end
