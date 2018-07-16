ActiveAdmin.register Customer, namespace: :data do
	before_filter :ensure_moderator!

	permit_params :version_id, :func_price_id, :a_appear_city_id, :a_appear_media_id, :name, :alt, :description, :marketsize_total, :purchaseRmin, :purchaseRmax, :revisitRmin, :revisitRmax, :rebuyRmin, :rebuyRmax, :rebuyIntervalmin, :rebuyIntervalmax

end
