ActiveAdmin.register CustQFunc do
  permit_params :function_usage_id, :function_id, :cust_func_id, :customer_id, :quarter_id, :parA, :parB, :parC, :parD
  before_filter :ensure_admin!
  actions :all, except: [:delete, :new, :create, :destroy]

  config.clear_action_items! # destroys edit button (we need action of edit, but not the button)

  action_item :edit, only: :show do
    q = Quarter.select(:game_id, :q_no).find(cust_q_func.quarter_id)
    q_max = Quarter.select(:q_no).where(game_id: q.game_id).order(q_no: :desc).take.q_no
    if cust_q_func.function_id.nil? 
      link_to "Select Function Type", edit_admin_cust_q_func_path(cust_q_func), method: :get unless q_max > q.q_no
    else
      link_to "Change Function Parameters", edit_admin_cust_q_func_path(cust_q_func), method: :get unless q_max > q.q_no
    end
  end

  action_item :delete_function, only: :show do
    unless cust_q_func.function_id.nil? 
      q = Quarter.select(:game_id, :q_no).find(cust_q_func.quarter_id)
      q_max = Quarter.select(:q_no).where(game_id: q.game_id).order(q_no: :desc).take.q_no
      link_to "Change Function Type", delete_function_admin_cust_q_func_path(cust_q_func), method: :put unless q_max > q.q_no
    end
  end

  member_action :delete_function, method: :put do
  	cust_q_func = CustQFunc.find(params[:id])
  	unless cust_q_func.function_id.nil?
  	  cust_q_func.update_attributes(
  	    function_id: nil, # parameters will automatically get nulled
          cust_func_id: nil
    	)
  	end
  	redirect_to edit_admin_cust_q_func_path(params[:id])
  end

  form do |f| # WORKS ONLY FOR EDIT!
    q = Quarter.select(:game_id, :q_no).find(cust_q_func.quarter_id)
    q_max = Quarter.select(:q_no).where(game_id: q.game_id).order(q_no: :desc).take.q_no
  	function_id = cust_q_func.function_id
  	customer_id = cust_q_func.customer_id
  	usage_id = cust_q_func.function_usage_id
    unless function_id.nil?
      function = Function.find(function_id)
      cust_func = CustFunc.where(function_id: function_id, customer_id: customer_id).take || function
    end
    f.inputs do
      f.input :quarter, input_html: {disabled: true}
      f.input :function_usage, input_html: {disabled: true}
      f.input :function, as: :select, collection: Function.where(function_usage_id: FunctionUsage.find(usage_id)).collect {|function| [function.name, function.id]}, 
			         input_html: {disabled: function_id.nil? ? false : true }, include_blank: false
      f.label "Different Parameter Ranges and Defaults for this type Of Customer.", class: 'paddingLeft red block' unless cust_q_func.cust_func_id.nil?
      f.label "Parameters should have up to 2 decimal points!", class: 'paddingLeft red block' unless function_id.nil?
      f.input :parA, label: "Par A: #{function.parAname} (Range: #{cust_func.parAmin}-#{cust_func.parAmax}) [Scale: #{function.parAscale}]", 
               min: cust_func.parAmin, max: cust_func.parAmax, step: 0.01, value: cust_func.parAdef, input_html: {disabled: q_max > q.q_no ? true : false} unless function_id.nil? || cust_func.parAdef.nil?
      f.input :parB, label: "Par B: #{function.parBname} (Range: #{cust_func.parBmin}-#{cust_func.parBmax}) [Scale: #{function.parBscale}]", 
               min: cust_func.parBmin, max: cust_func.parBmax, step: 0.01, value: cust_func.parBdef, input_html: {disabled: q_max > q.q_no ? true : false} unless function_id.nil? || cust_func.parBdef.nil?
      f.input :parC, label: "Par C: #{function.parCname} (Range: #{cust_func.parCmin}-#{cust_func.parCmax}) [Scale: #{function.parCscale}]", 
               min: cust_func.parCmin, max: cust_func.parCmax, step: 0.01, value: cust_func.parCdef, input_html: {disabled: q_max > q.q_no ? true : false} unless function_id.nil? || cust_func.parCdef.nil?
      f.input :parD, label: "Par D: #{function.parDname} (Range: #{cust_func.parDmin}-#{cust_func.parDmax}) [Scale: #{function.parDscale}]", 
               min: cust_func.parDmin, max: cust_func.parDmax, step: 0.01, value: cust_func.parDdef, input_html: {disabled: q_max > q.q_no ? true : false} unless function_id.nil? || cust_func.parDdef.nil?
    end
	  f.actions do
      if function_id.nil?
      	f.action :submit, label: "Save Function Type"
      else
      	f.action :reset, label: "Reset Values", as: :button, wrapper_html: {class: 'floatRight'}
      	f.action :submit, label: "Update Function Parameters"
      end
      f.action :cancel, label: "Cancel Changes", wrapper_html: {class: 'cancel'}
    end
  end


  show do
	  default_main_content
    q = Quarter.select(:game_id, :q_no).find(cust_q_func.quarter_id)
    q_max = Quarter.select(:q_no).where(game_id: q.game_id).order(q_no: :desc).take.q_no
    if cust_q_func.function_id.nil? 
      strong(button_to "Select Function Type", edit_admin_cust_q_func_path(cust_q_func), method: :get) unless q_max > q.q_no
    else
      strong(button_to "Change Function Parameters", edit_admin_cust_q_func_path(cust_q_func), method: :get) unless q_max > q.q_no
    end
  end
end
