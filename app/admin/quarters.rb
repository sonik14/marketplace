ActiveAdmin.register Quarter do
  permit_params :game_id, :q_no, :rangeDemandPer, :fundingAmountMax
  before_filter :ensure_admin!

  actions  :index, :show, :update, :edit
end
