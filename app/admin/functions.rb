ActiveAdmin.register Function, namespace: :data do
	before_filter :ensure_moderator!
end
