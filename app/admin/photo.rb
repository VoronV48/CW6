ActiveAdmin.register Photo do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
 permit_params :name, :image, :user_id
#
  form do |f|
    f.inputs do

      f.input :name
      f.input :image, :as => :file, :hint => image_tag(f.object.image.url(:thumb))
    end
    f.actions
  end

  index do
    selectable_column
    id_column
    column :image do |photo|
      image_tag photo.image.url(:thumb)
    end
    column :name do |photo|
      link_to photo.name, admin_photo_path(photo)
    end
    actions
  end
	controller do
		def create
		  	@photo = current_user.photos.create(permitted_params)
		    @photo.save
		    redirect_to root_path
	  	end
	end
end
