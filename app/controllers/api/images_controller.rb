class Api::ImagesController < ApplicationController

  def create
    file = Tempfile.new('foo')
    base64 = Base64.decode64(params[:image].tr(' ', '+'))
    image = StringIO.new(base64)
    image.class.class_eval { attr_accessor :original_filename, :content_type }
    image.original_filename = SecureRandom.hex + '.png'
    image.content_type = 'image/png'
    File.open(file, 'wb') do|f|
      f.write(base64)
    end
    cloudinary = Cloudinary::Uploader.upload(file)
    image_url = cloudinary["url"]
    @listing = Listing.find(params[:listing_id])
    image = Image.create(url: image_url)
    @listing.images << image
    if @listing.save
      render :ok, json: {image_url: image_url}
    else
      @errors = listing.errors.full_messages
      render json: { message: @errors }, status: :unprocessable_entity
    end
  end

  private

  def image_params
    params.permit(:image, :listing_id, :user_id, :acceptable_offer_id)
  end

end
