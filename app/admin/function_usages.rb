ActiveAdmin.register FunctionUsage, namespace: :data do
	before_filter :ensure_moderator!
	permit_params :version_id, :differentEachCust, :differentEachQ, :name
end
