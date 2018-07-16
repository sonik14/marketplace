ActiveAdmin.register CustCity, namespace: :data do
	before_filter :ensure_moderator!
end
