ActiveAdmin.register Quarter do
  	permit_params :game_id, :q_no, :rangeDemandPer, :fundingAmountMax
  	before_filter :ensure_admin!

  	actions :all, except: [:delete, :new, :create, :destroy]

  	config.clear_action_items! # destroys edit button (we need action of edit, but not the button)

	action_item :edit, only: :show do
		q = Quarter.select(:game_id, :q_no).find(quarter.id)
		q_max = Quarter.select(:q_no).where(game_id: q.game_id).order(q_no: :desc).take.q_no
		link_to "Change General Quarter Parameters", edit_admin_quarter_path(quarter), method: :get unless q_max > q.q_no
	end

	form do |f|
		version = Version.find(Game.find(quarter.game_id).version_id)
		version.rangeDemandMin = (version.rangeDemandMin*100).round(0)
		version.rangeDemandMax = (version.rangeDemandMax*100).round(0)
		q_max = Quarter.select(:q_no).where(game_id: quarter.game_id).order(q_no: :desc).take.q_no
		f.inputs do
			f.input :name, input_html: {disabled: true}
      		f.input :rangeDemandPer, min: version.rangeDemandMin, max: version.rangeDemandMax, step: 1, 
      				input_html: {disabled: q_max > quarter.q_no ? true : false},
      				label: "Range Deman Percent [Range: #{version.rangeDemandMin}-#{version.rangeDemandMax}, Decimals: 0]"
			f.input :fundingAmountMax, input_html: {disabled: q_max > quarter.q_no ? true : false}
		end
		f.actions
	end
end
