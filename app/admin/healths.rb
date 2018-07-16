ActiveAdmin.register Health, namespace: :data do
  permit_params :version_id, :name
  before_filter :ensure_moderator!
end
