ActiveAdmin.register CustG do
  permit_params :customers_id, :game_id, :rebuyPer, :rebuyInterval
  before_filter :ensure_admin!

  actions :all, except: [:delete, :new, :create, :destroy]
end
