class Api::ListingsController < ApplicationController

  def index
    if params[:user_id].present?
      @user = User.find(params[:user_id])
      @listings = @user.listings
    end

    if params[:id].present?
      @responses = Listing.all
    end
  end

  def create
    @listing = Listing.new(listing_params)
    @user = User.find(params[:user_id])
    @listing.user = @user
    if @listing.save
      render "api/listings/show", status: :ok
    else
      @errors = @listing.errors.full_messages
      render json: { message: @errors }, status: :unprocessable_entity
    end
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def update
    @listing = Listing.find(params[:id])
  end

  def destroy
    @listing = Listing.find(params[:id])
    if @listing.destroy
      head :ok
    end
  end

  private

  def listing_params
    params.permit(:title, :body, :longitude, :latitude, :city, :zip_code, :image_url)
  end

end
