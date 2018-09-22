ActiveAdmin.register FunctionG do
  permit_params :function_usage_id, :function_id, :game_id, :parA, :parB, :parC, :parD
  before_filter :ensure_admin!

  actions :all, except: [:delete, :new, :create, :destroy]

  config.clear_action_items! # destroys edit button (we need action of edit, but not the button)

  action_item :edit, only: :show do
    q_max = Quarter.select(:q_no).where(game_id: function_g.game_id).order(q_no: :desc).take.q_no
	  if function_g.function_id.nil? 
  	  link_to "Select Function Type", edit_admin_function_g_path(function_g), method: :get unless q_max > 1
  	else
  	  link_to "Change Function Parameters", edit_admin_function_g_path(function_g), method: :get unless q_max > 1
  	end
  end

  action_item :delete_function, only: :show do
	  unless function_g.function_id.nil?
      q_max = Quarter.select(:q_no).where(game_id: function_g.game_id).order(q_no: :desc).take.q_no
	    link_to "Change Function Type", delete_function_admin_function_g_path(function_g), method: :put unless q_max > 1
	  end
  end

  member_action :delete_function, method: :put do
  	function_g = FunctionG.find(params[:id])
  	unless function_g.function_id.nil?
	    function_g.update_attributes(
	      function_id: nil # parameters will automatically get nulled
  	  )
	  end
  	redirect_to edit_admin_function_g_path(params[:id])
  end

  form do |f| # WORKS ONLY FOR EDIT!
  	function_g = FunctionG.select(:function_usage_id, :function_id, :game_id).where(id: params[:id]).take
    q_max = Quarter.select(:q_no).where(game_id: function_g.game_id).order(q_no: :desc).take.q_no
  	function_id = function_g.function_id
  	usage_id = function_g.function_usage_id
  	function = Function.find(function_id) unless function_id.nil?
    f.inputs do
      f.input :game, input_html: {disabled: true}
      f.input :function_usage, input_html: {disabled: true}
      f.input :function, as: :select, collection: Function.where(function_usage_id: FunctionUsage.find(usage_id)).collect {|function| [function.name, function.id]}, 
			         input_html: {disabled: function_id.nil? ? false : true }, include_blank: false
      f.label "Parameters should have up to 2 decimal points!", class: 'paddingLeft red' unless function_id.nil?
      f.input :parA, label: "Par A: #{function.parAname} (Range: #{function.parAmin}-#{function.parAmax}) [Scale: #{function.parAscale}]", 
               min: function.parAmin, max: function.parAmax, step: 0.01, value: function.parAdef, input_html: {disabled: q_max > 1 ? true : false} unless function_id.nil? || function.parAdef.nil?
      f.input :parB, label: "Par B: #{function.parBname} (Range: #{function.parBmin}-#{function.parBmax}) [Scale: #{function.parBscale}]", 
               min: function.parBmin, max: function.parBmax, step: 0.01, value: function.parBdef, input_html: {disabled: q_max > 1 ? true : false} unless function_id.nil? || function.parBdef.nil?
      f.input :parC, label: "Par C: #{function.parCname} (Range: #{function.parCmin}-#{function.parCmax}) [Scale: #{function.parCscale}]", 
               min: function.parCmin, max: function.parCmax, step: 0.01, value: function.parCdef, input_html: {disabled: q_max > 1 ? true : false} unless function_id.nil? || function.parCdef.nil?
      f.input :parD, label: "Par D: #{function.parDname} (Range: #{function.parDmin}-#{function.parDmax}) [Scale: #{function.parDscale}]", 
               min: function.parDmin, max: function.parDmax, step: 0.01, value: function.parDdef, input_html: {disabled: q_max > 1 ? true : false} unless function_id.nil? || function.parDdef.nil?
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
    q_max = Quarter.select(:q_no).where(game_id: function_g.game_id).order(q_no: :desc).take.q_no
    if function_g.function_id.nil? 
      strong(button_to "Select Function Type", edit_admin_function_g_path(function_g), method: :get) unless q_max > 1
    else
      strong(button_to "Change Function Parameters", edit_admin_function_g_path(function_g), method: :get) unless q_max > 1
    end
  end
end
