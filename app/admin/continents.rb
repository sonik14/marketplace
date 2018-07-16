ActiveAdmin.register Continent, namespace: :data do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :version_id, :name, :health_e_id, :health_w_id, :factoryCityName
  before_filter :ensure_moderator!

  form do |f|
    f.inputs do
   	  f.input :version
      f.input :name
      f.input :health_e
      f.input :health_w
      f.input :factoryCityName
    end
    f.actions
  end

end
