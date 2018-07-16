ActiveAdmin.register Month, namespace: :data  do
	before_filter :ensure_moderator!
end
