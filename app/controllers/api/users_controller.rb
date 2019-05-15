class Api::UsersController < ApplicationController

  before_action :verify_jwt_token, except: [:create]

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
      debugger
      render json: { message: @errors }, status: :unauthorized
    end
  end


  private
  def user_params
    params.permit(:first_name, :last_name, :email, :username, :password)
  end

end
