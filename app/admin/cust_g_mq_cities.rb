ActiveAdmin.register CustGMqCity do
  # permit_params :cust_city_id, :mq_id, :demandP, :demandS, :revisits1S, :revisits2S, :revisits3S
  before_filter :ensure_admin!

  actions :index, :show
end
