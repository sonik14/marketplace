ActiveAdmin.register FunctionUsage, namespace: :data do
	before_filter :ensure_moderator!
end
