ActiveAdmin.register Company do
  permit_params :game_id, :ceo_id #view name, continent
  before_filter :ensure_admin!

  actions :all, except: [:update, :edit, :delete, :destroy]

  filter :game
  filter :ceo, as: :select, collection: User.where(role_id: Role.select("id").where(name: "ceo").take).collect {|user| [user.name, user.id]}
  filter :name

  index do
    selectable_column
    id_column
    column :game, sortable: 'companies.game_id'
    column :name
    column :ceo
    column :continent
    actions
  end

  form do |f|
    f.inputs do
      f.input :game, as: :select, collection: Game.where.not(id: Quarter.select(:game_id).distinct).collect {|game| [game.name, game.id]}, include_blank: false
      f.input :ceo, as: :select, collection: User.where(role_id: Role.select("id").where(name: "ceo").take).collect {|user| [user.name, user.id]}, include_blank: false
      # f.hidden_field :continent_id, value: nil # auto assign is nil, until user selects continent of his factory (thus you can avoid this line)
    end
    f.actions
  end

  show do
    default_main_content
    strong (button_to "Add New CEO", new_admin_company_path, method: :get)
  end
end
