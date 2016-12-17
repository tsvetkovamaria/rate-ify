ActiveAdmin.register Review do

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
permit_params  :body, :grade_food, :grade_service, :grade_interior, :place_id, :user_id

index do
  selectable_column
  id_column
  column :body
  column :place_id
  column :grade_food
  column :grade_service
  column :grade_interior
  
  actions
end

form do |f|
  f.inputs do
    f.input :body
    f.input :place_id,    :as => :select,      :collection => Place.all
    f.input :grade_food
    f.input :grade_service
    f.input :grade_interior
   
    f.input :user_id,     :as => :select,      :collection => User.all
  end
  f.actions
end

show do
  attributes_table do
    row :body
    row :grade_food
    row :grade_service
    row :grade_interior
    row :place_id
    row :user_id
  end
  active_admin_comments
end

end
