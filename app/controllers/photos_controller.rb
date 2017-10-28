class PhotosController < InheritedResources::Base
  def index
    @photos = Photo.order(created_at: :desc)
  end

  def show
  	authorize! :read, @photo
  	@photo = Photo.find(params[:id])
  end

  def new
  	authorize! :create, @photo
    @photo = Photo.new
  end

  def create
  	authorize! :create, @photo
  	@photo = current_user.photos.create(photo_params)
    @photo.save
    redirect_to root_path
  end

  def destroy
  	authorize! :destroy, @photo
  	@photo = Photo.find(params[:id]) 
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to photos_url, notice: 'Photo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def photo_params
      params.require(:photo).permit(:name, :user_id, :image)
    end
end

