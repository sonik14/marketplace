ActiveAdmin.register City, namespace: :data do
  permit_params :continent_id, :name, :population, :marketsize, :marketsizeRmin, :marketsizeRmax
  before_filter :ensure_moderator!

  index do
    selectable_column
    id_column
    column :continent, sortable: 'cities.continent_id'
    column :name
    column :population
    column :marketsize
    column :marketsizeRmin
    column :marketsizeRmax
    actions
  end

  filter :continent
  filter :name
  filter :population
  filter :marketsize

  form do |f|
    f.inputs do
      f.input :continent
      f.input :name
      f.input :population
      f.input :marketsize
      f.input :marketsizeRmin
      f.input :marketsizeRmax
    end
    f.actions
  end

end
