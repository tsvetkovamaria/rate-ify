ActiveAdmin.register Category do

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

permit_params :name

index do
  selectable_column
  id_column
  column :name
  actions
end

form do |f|
  f.inputs do
    f.input :name
  end
  f.actions
end

show do
  attributes_table do
    row :name
  end
  active_admin_comments
end

end
