ActiveAdmin.register CustCity, namespace: :data do
	before_filter :ensure_moderator!
end

ActiveAdmin.register CustCity, namespace: :admin do
	before_filter :ensure_admin!

  	actions :index, :show
end