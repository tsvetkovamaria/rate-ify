ActiveAdmin.register Picture do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
permit_params  :title, :place_id, :user_id, :image

index do
  selectable_column
  id_column
  column :image do |picture|
    image_tag picture.image.url(:thumb)
  end
  column :place_id
  column :user_id
  actions
end

form do |f|
  f.inputs do
    f.input :image,       :as => :file,        :hint => image_tag(f.object.image.url(:thumb))
    f.input :place_id,    :as => :select,      :collection => Place.all
   
    f.input :user_id,     :as => :select,      :collection => User.all
  end
  f.actions
end

show do
  attributes_table do
    row :image do |place|
      image_tag place.image.url(:medium)
    end
    row :place_id
    row :user_id
  end
  active_admin_comments
end

end
