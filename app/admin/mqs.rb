ActiveAdmin.register Mq do
  	# permit_params :month_id, :quarter_id, :name, :demandPmin, :demandPmaxs, :demandS
	before_filter :ensure_admin!

  	actions :index, :show
end
