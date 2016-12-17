ActiveAdmin.register Place do

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
permit_params :title, :description, :category_id, :user_id, :image

index do
  selectable_column
  id_column
  column :title
  column :image do |place|
    image_tag place.image.url(:thumb)
  end
  column :description
  actions
end

form do |f|
  f.inputs do
    f.input :title
    f.input :description
    f.input :category_id, :as => :select,      :collection => Category.all
    f.input :user_id,     :as => :select,      :collection => User.all
    f.input :image,       :as => :file,        :hint => image_tag(f.object.image.url(:thumb))
  end
  f.actions
end

show do
  attributes_table do
    row :image do |place|
      image_tag place.image.url(:medium)
    end
    row :title
    row :description
    row :category_id
    row :user_id
  end
  active_admin_comments
end

end
