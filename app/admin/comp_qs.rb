ActiveAdmin.register CompQ do
  	permit_params :company_id, :quarter_id, :fundingPer
  	before_filter :ensure_admin!

  	actions :all, except: [:delete, :new, :create, :destroy]

  	config.clear_action_items! # destroys edit button (we need action of edit, but not the button)

	action_item :edit, only: :show do
		q = Quarter.select(:game_id, :q_no).find(comp_q.quarter_id)
		q_max = Quarter.select(:q_no).where(game_id: q.game_id).order(q_no: :desc).take.q_no
		link_to "Change Parameters", edit_admin_comp_q_path(comp_q), method: :get unless q_max > q.q_no
	end

	filter :company_id
	filter :quarter_id
	filter :fundingPer

	index do
		selectable_column
		id_column
		column :company, sortable: 'comp_qs.company_id'
		column :quarter, sortable: 'comp_qs.quarter_id'
		column :fundingPer
		actions
	end

	form do |f|
	    q = Quarter.select(:game_id, :q_no, :fundingAmountMax).find(comp_q.quarter_id)
	    q_max = Quarter.select(:q_no).where(game_id: q.game_id).order(q_no: :desc).take.q_no
		f.inputs do
			f.input :company, input_html: {disabled: true}
			f.input :quarter, input_html: {disabled: true}
			f.input :fundingPer, label: "Choose the Funding Percent this team will get this Quarter. Range: 0-100", 
               input_html: {disabled: q_max > q.q_no ? true : false} unless q.fundingAmountMax.nil? || q.fundingAmountMax <= 0
		end
		f.actions
	end
end
