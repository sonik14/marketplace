ActiveAdmin.register CustGFunc do
  permit_params :function_usage_id, :function_id, :cust_func_id, :customer_id, :game_id, :parA, :parB, :parC, :parD
  before_filter :ensure_admin!

  actions :all, except: [:delete, :new, :create, :destroy]

  config.clear_action_items! # destroys edit button (we need action of edit, but not the button)

  action_item :edit, only: :show do
  	q_max = Quarter.select(:q_no).where(game_id: cust_g_func.game_id).order(q_no: :desc).take.q_no
	  if cust_g_func.function_id.nil? 
  	  link_to "Select Function Type", edit_admin_cust_g_func_path(cust_g_func), method: :get unless q_max > 1
  	else
  	  link_to "Change Function Parameters", edit_admin_cust_g_func_path(cust_g_func), method: :get unless q_max > 1
  	end
  end

  action_item :delete_function, only: :show do
  	unless cust_g_func.function_id.nil?
    	q_max = Quarter.select(:q_no).where(game_id: cust_g_func.game_id).order(q_no: :desc).take.q_no
  	  link_to "Change Function Type", delete_function_admin_cust_g_func_path(cust_g_func), method: :put unless q_max > 1
  	end
  end

  member_action :delete_function, method: :put do
  	cust_g_func = CustGFunc.find(params[:id])
  	unless cust_g_func.function_id.nil?
  	  cust_g_func.update_attributes(
  	    function_id: nil, # parameters will automatically get nulled
  	    cust_func_id: nil
    	)
  	end
  	redirect_to edit_admin_cust_g_func_path(params[:id])
  end

  form do |f| # WORKS ONLY FOR EDIT!
  	q_max = Quarter.select(:q_no).where(game_id: cust_g_func.game_id).order(q_no: :desc).take.q_no
  	function_id = cust_g_func.function_id
  	customer_id = cust_g_func.customer_id
  	usage_id = cust_g_func.function_usage_id
  	unless function_id.nil?
  	  function = Function.find(function_id)
  	  cust_func = CustFunc.where(function_id: function_id, customer_id: customer_id).take || function
  	end
    f.inputs do
      f.input :game, input_html: {disabled: true}
      f.input :customer, input_html: {disabled: true}
      f.input :function_usage, input_html: {disabled: true}
      f.input :function, as: :select, collection: Function.where(function_usage_id: FunctionUsage.find(usage_id)).collect {|function| [function.name, function.id]}, 
			         input_html: {disabled: !function_id.nil? || q_max > 1 ? true : false}, include_blank: false
      f.label "Different Parameter Ranges and Defaults for this type Of Customer.", class: 'paddingLeft red block' unless cust_g_func.cust_func_id.nil?
      f.label "Parameters should have up to 2 decimal points!", class: 'paddingLeft red block' unless function_id.nil?
      f.input :parA, label: "Par A: #{function.parAname} (Range: #{cust_func.parAmin}-#{cust_func.parAmax}) [Round to: #{function.parAscale} Decimal Points]", 
      		     min: cust_func.parAmin, max: cust_func.parAmax, step: 1.0/(10**function.parAscale), input_html: {disabled: q_max > 1 ? true : false} unless function_id.nil? || cust_func.parAdef.nil?
      f.input :parB, label: "Par B: #{function.parBname} (Range: #{cust_func.parBmin}-#{cust_func.parBmax}) [Round to: #{function.parBscale} Decimal Points]", 
      		     min: cust_func.parBmin, max: cust_func.parBmax, step: 1.0/(10**function.parBscale), input_html: {disabled: q_max > 1 ? true : false} unless function_id.nil? || cust_func.parBdef.nil?
      f.input :parC, label: "Par C: #{function.parCname} (Range: #{cust_func.parCmin}-#{cust_func.parCmax}) [Round to: #{function.parCscale} Decimal Points]", 
      		     min: cust_func.parCmin, max: cust_func.parCmax, step: 1.0/(10**function.parCscale), input_html: {disabled: q_max > 1 ? true : false} unless function_id.nil? || cust_func.parCdef.nil?
      f.input :parD, label: "Par D: #{function.parDname} (Range: #{cust_func.parDmin}-#{cust_func.parDmax}) [Round to: #{function.parDscale} Decimal Points]", 
      		     min: cust_func.parDmin, max: cust_func.parDmax, step: 1.0/(10**function.parDscale), input_html: {disabled: true} unless function_id.nil? || cust_func.parDdef.nil?
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
  	q_max = Quarter.select(:q_no).where(game_id: cust_g_func.game_id).order(q_no: :desc).take.q_no
    if cust_g_func.function_id.nil? 
      strong(button_to "Select Function Type", edit_admin_cust_g_func_path(cust_g_func), method: :get) unless q_max > 1
    else
      strong(button_to "Change Function Parameters", edit_admin_cust_g_func_path(cust_g_func), method: :get) unless q_max > 1
    end
  end
end
