ActiveAdmin.register CustG do
	permit_params :customer_id, :game_id, :rebuyPer, :rebuyInterval, :A1_prod_char_SI, :A2_adv_char_SI, :A3_price_SI, :A4_quality_SI
	before_filter :ensure_admin!

	actions :all, except: [:delete, :new, :create, :destroy]

	config.clear_action_items! # destroys edit button (we need action of edit, but not the button)

	action_item :edit, only: :show do
		q_max = Quarter.select(:q_no).where(game_id: cust_g.game_id).order(q_no: :desc).take.q_no
	  	link_to "Change Parameters", edit_admin_cust_g_path(cust_g), method: :get unless q_max > 1
	end

	filter :customer_id
	filter :game_id
	filter :rebuyPer
	filter :rebuyInterval

	index do
		selectable_column
		id_column
		column :customer, sortable: 'cust_gs.customer_id'
		column :game, sortable: 'cust_gs.game_id'
		column :rebuyPer
		column :rebuyInterval
		column :A1_prod_char_SI
		column :A2_adv_char_SI
		column :A3_price_SI
		column :A4_quality_SI
		actions
	end

	form do |f|
	    q_max = Quarter.select(:q_no).where(game_id: cust_g.game_id).order(q_no: :desc).take.q_no
	    cust = Customer.find(cust_g.customer_id)
	    step = 1.0/(10 ** cust.scales) * 100
	    decimals = cust.scales-2
	    cust.rebuyRmin = cust.rebuyRmin * 100 unless cust.rebuyRmin.nil?
	    cust.rebuyRmax = cust.rebuyRmax * 100 unless cust.rebuyRmax.nil?
	    cust.rebuyIntervalmin = cust.rebuyIntervalmin unless cust.rebuyIntervalmin.nil?
	    cust.rebuyIntervalmax = cust.rebuyIntervalmax unless cust.rebuyIntervalmax.nil?
	    if cust.rebuyIntervalmax.nil?
	    	cust.rebuyIntervalmax = Game.find(cust_g.game_id).duration + 1
	    end
	    cust.A1_prod_char_SI_min = cust.A1_prod_char_SI_min * 100
	    cust.A1_prod_char_SI_max = cust.A1_prod_char_SI_max * 100
	    cust.A2_adv_char_SI_min = cust.A2_adv_char_SI_min * 100
	    cust.A2_adv_char_SI_max = cust.A2_adv_char_SI_max * 100
	    cust.A3_price_SI_min = cust.A3_price_SI_min * 100
	    cust.A3_price_SI_max = cust.A3_price_SI_max * 100
	    cust.A4_quality_SI_min = cust.A4_quality_SI_min * 100
	    cust.A4_quality_SI_max = cust.A4_quality_SI_max * 100
		f.inputs do
			f.input :customer, input_html: {disabled: true}
			f.input :game, input_html: {disabled: true}
      		f.input :rebuyPer, label: "Choose the Rebuy Percent that will occur in the Game [Range: #{cust.rebuyRmin}-#{cust.rebuyRmax}] [Decimals: #{decimals}]", 
               min: cust.rebuyRmin, max:cust.rebuyRmax, step: step, input_html: {disabled: q_max > 1 ? true : false} unless cust.rebuyRmin.nil? || cust.rebuyRmax.nil?
      		f.input :rebuyInterval, label: "Choose the Rebuy Interval of a specific Customer that will occur in the Game [Range: #{cust.rebuyIntervalmin}-#{cust.rebuyIntervalmax}]", 
               min: cust.rebuyIntervalmin, max:cust.rebuyIntervalmax, step: step, input_html: {disabled: q_max > 1 ? true : false} unless cust.rebuyIntervalmin.nil? || cust.rebuyIntervalmax.nil?
      		f.input :A1_prod_char_SI, label: "Choose the Customer Sensitivity towards Product Characteristics [Range: #{cust.A1_prod_char_SI_min}-#{cust.A1_prod_char_SI_max}] [Decimals: #{decimals}]", 
               min: cust.A1_prod_char_SI_min, max:cust.A1_prod_char_SI_max, step: step, input_html: {disabled: q_max > 1 ? true : false}
      		f.input :A2_adv_char_SI, label: "Choose the Customer Sensitivity towards Advertisment Characteristics [Range: #{cust.A2_adv_char_SI_min}-#{cust.A2_adv_char_SI_max}] [Decimals: #{decimals}]", 
               min: cust.A2_adv_char_SI_min, max:cust.A2_adv_char_SI_max, step: step, input_html: {disabled: q_max > 1 ? true : false}
      		f.input :A3_price_SI, label: "Choose the Customer Sensitivity towards Pricing [Range: #{cust.A3_price_SI_min}-#{cust.A3_price_SI_max}] [Decimals: #{decimals}]", 
               min: cust.A3_price_SI_min, max:cust.A3_price_SI_max, step: step, input_html: {disabled: q_max > 1 ? true : false}
      		f.input :A4_quality_SI, label: "Customer Sensitivity towards Quality is set AUTOMATICALLY so as the sum of these 4 parameters to be 100 [Range: #{cust.A4_quality_SI_min}-#{cust.A4_quality_SI_max}] [Decimals: #{decimals}]", input_html: {disabled: true}
		end
		f.actions
	end
end
