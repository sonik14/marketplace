ActiveAdmin.register_page "Dashboard", namespace: :admin do
  content title: "Game Management" do
    columns do
      column do
        panel "Recent Games" do
          table_for Game.order("id desc").limit(15) do
            column :id
            column "Game Name", :name do |game|
              link_to game.name, [:admin,game]
            end
            column :starting_year

            column "Game Status", :name do |game|
              q = Quarter.where(game_id: game.id).order(q_no: :desc).take # TODO: if possible to be executed once and not for each column
              if q.nil?
                status = "Not Started yet."
              else
                status = link_to "Quarter: " + q.q_no.to_s, [:admin,q]
              end
            end

            column "Proceed Game", :name do |game|
              q = Quarter.select(:q_no).where(game_id: game.id).order(q_no: :desc).take
              if q.nil? 
                proceed = button_to "Start Game", proceed_admin_game_path(game), method: :put, 
                  data: {confirm: "Please be sure that you have filled all the required parameters:\n-players of the game\nDo you want to start the game now?" } #, target: "_blank" if you want to open new window
              elsif q.q_no < game.duration
                proceed = button_to "Go to Next Quarter", proceed_admin_game_path(game), method: :put, 
                  data: {confirm: "Please be sure that you have filled all the required parameters:\n-function parameters for the game/quarter\n-function parameters depending on customer. \nDo you want to proceed to the following quarter?" }
              elsif q.q_no == game.duration && !game.finished
                proceed = button_to "Finish Game", proceed_admin_game_path(game), method: :put, 
                  data: {confirm: "Please be sure that you have filled all the required parameters:\n-function parameters for the game/quarter\n-function parameters depending on customer. \nDo you want to proceed to the final results?" }
              end
            end
          end
          strong (button_to "Create New Game", new_admin_game_path, class: 'floatRight', method: :get)
          strong (link_to "Show All Games", [:admin,:games]) #link_to "Show All Games" , 'games#index'
        end
      end
    end
  end
end

ActiveAdmin.register_page "Dashboard", namespace: :data do
  content title: "Data Management" do
  end
end