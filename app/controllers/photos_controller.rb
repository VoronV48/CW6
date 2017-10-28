class PhotosController < InheritedResources::Base

  private

    def photo_params
      params.require(:photo).permit(:name, :user_id)
    end
end

