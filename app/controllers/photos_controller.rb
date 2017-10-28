class PhotosController < InheritedResources::Base
  def index
    @photos = Photo.all
  end

  def show
  end

  def new
    @photo = Photo.new
  end

  def create
  	@photo = current_user.photos.create(photo_params)
    @photo.save
    redirect_to root_path
  end

  def destroy
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to photos_url, notice: 'pPhoto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def photo_params
      params.require(:photo).permit(:name, :user_id, :image)
    end
end

