ActiveAdmin.register FunctionQ do
  permit_params :function_usage_id, :function_id, :quarter_id, :parA, :parB, :parC, :parD
  before_filter :ensure_admin!

  actions :all, except: [:delete, :new, :create, :destroy]

  config.clear_action_items! # destroys edit button (we need action of edit, but not the button)

  action_item :edit, only: :show do
    q = Quarter.select(:game_id, :q_no).find(function_q.quarter_id)
    q_max = Quarter.select(:q_no).where(game_id: q.game_id).order(q_no: :desc).take.q_no
	  if function_q.function_id.nil? 
  	  link_to "Select Function Type", edit_admin_function_q_path(function_q), method: :get unless q_max > q.q_no
  	else
  	  link_to "Change Function Parameters", edit_admin_function_q_path(function_q), method: :get unless q_max > q.q_no
  	end
  end

  action_item :delete_function, only: :show do
  	unless function_q.function_id.nil? 
      q = Quarter.select(:game_id, :q_no).find(function_q.quarter_id)
      q_max = Quarter.select(:q_no).where(game_id: q.game_id).order(q_no: :desc).take.q_no
  	  link_to "Change Function Type", delete_function_admin_function_q_path(function_q), method: :put unless q_max > q.q_no
  	end
  end

  member_action :delete_function, method: :put do
  	function_q = FunctionQ.find(params[:id])
  	unless function_q.function_id.nil?
	    function_q.update_attributes(
	      function_id: nil # parameters will automatically get nulled
  	  )
	  end
  	redirect_to edit_admin_function_q_path(params[:id])
  end

  form do |f| # WORKS ONLY FOR EDIT!
    q = Quarter.select(:game_id, :q_no).find(function_q.quarter_id)
    q_max = Quarter.select(:q_no).where(game_id: q.game_id).order(q_no: :desc).take.q_no
  	function_id = function_q.function_id
  	usage_id = function_q.function_usage_id
  	function = Function.find(function_id) unless function_id.nil?
    f.inputs do
      f.input :quarter, input_html: {disabled: true}
      f.input :function_usage, input_html: {disabled: true}
      f.input :function, as: :select, collection: Function.where(function_usage_id: FunctionUsage.find(usage_id)).collect {|function| [function.name, function.id]}, 
			         input_html: {disabled: !function_id.nil? || q_max > q.q_no ? true : false}, include_blank: false
      f.label "Parameters should have up to 2 decimal points!", class: 'paddingLeft red' unless function_id.nil?
      f.input :parA, label: "Par A: #{function.parAname} (Range: #{function.parAmin}-#{function.parAmax}) [Round to: #{function.parAscale} Decimal Points]", 
               min: function.parAmin, max:function.parAmax, step: 1.0/(10**function.parAscale), value: function.parAdef, input_html: {disabled: q_max > q.q_no ? true : false} unless function_id.nil? || function.parAdef.nil?
      f.input :parB, label: "Par B: #{function.parBname} (Range: #{function.parBmin}-#{function.parBmax}) [Round to: #{function.parBscale} Decimal Points]", 
               min: function.parBmin, max:function.parBmax, step: 1.0/(10**function.parBscale), value: function.parBdef, input_html: {disabled: q_max > q.q_no ? true : false} unless function_id.nil? || function.parBdef.nil?
      f.input :parC, label: "Par C: #{function.parCname} (Range: #{function.parCmin}-#{function.parCmax}) [Round to: #{function.parCscale} Decimal Points]", 
               min: function.parCmin, max:function.parCmax, step: 1.0/(10**function.parCscale), value: function.parCdef, input_html: {disabled: q_max > q.q_no ? true : false} unless function_id.nil? || function.parCdef.nil?
      f.input :parD, label: "Par D: #{function.parDname} (Range: #{function.parDmin}-#{function.parDmax}) [Round to: #{function.parDscale} Decimal Points]", 
               min: function.parDmin, max:function.parDmax, step: 1.0/(10**function.parDscale), value: function.parDdef, input_html: {disabled: q_max > q.q_no ? true : false} unless function_id.nil? || function.parDdef.nil?
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
    q = Quarter.select(:game_id, :q_no).find(function_q.quarter_id)
    q_max = Quarter.select(:q_no).where(game_id: q.game_id).order(q_no: :desc).take.q_no
    if function_q.function_id.nil? 
      strong(button_to "Select Function Type", edit_admin_function_q_path(function_q), method: :get) unless q_max > q.q_no
    else
      strong(button_to "Change Function Parameters", edit_admin_function_q_path(function_q), method: :get) unless q_max > q.q_no
    end
  end
end
