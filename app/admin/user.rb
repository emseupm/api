ActiveAdmin.register User do
  
  permit_params :name, :email, :password, :first_name,
                :last_name, :phone, :roles

  filter :email
  filter :firts_name
  filter :last_name

  index do
    selectable_column
    column :email, :sortable => true
    column "Name", :first_name, :sortable => true do |user|
      "#{user.first_name} #{user.last_name}"
    end

    column :roles
    column do |user|
      link_to('Edit', edit_admin_user_path(user))
    end 
    actions
  end


  form do |f|
    f.inputs 'Account information' do
      f.input :email
      f.input :password
      f.input :password_confirmation, :label => "Re-enter password"
      f.input :roles, :as => :select, :collection => User.roles.keys
    end
      
    f.inputs 'User information' do
      f.input :first_name
      f.input :last_name
      f.input :phone
    end
    f.actions
  end
end
