ActiveAdmin.register CompQ do
  permit_params :company_id, :quarter_id, :fundingPer
  before_filter :ensure_admin!

  actions :all, except: [:delete, :new, :create, :destroy]
end
