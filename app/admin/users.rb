ActiveAdmin.register User do
  permit_params :role_id, :email, :first_name, :last_name, :username, :password, :password_confirmation
  before_filter :ensure_admin!

  actions :all, except: [:delete, :destroy]

  index do
    selectable_column
    id_column
    column :role, sortable: 'users.role_id'
    column :email
    column :first_name
    column :last_name
    column :username
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :role
  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :role
      f.input :email
      f.input :first_name
      f.input :last_name
      f.input :username
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
