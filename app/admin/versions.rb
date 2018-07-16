ActiveAdmin.register Version, namespace: :data do
  permit_params :mainNo, :name, :ill_percent_range, :illPerRmin
  before_filter :ensure_moderator!
  form do |f|
    f.inputs do
   	  f.input :mainNo, less_than_or_equal_to: (Version.maximum("mainNo")+1)
=begin
      {
        :as => :range, #bar not suggested for accuracy, #last, #find
        :in => 1..(params[:id].to_i+1),
        :step => 1
      }
=end
      f.input :name, {input_html: {disabled: params[:id] ? true : false}}
      f.input :illPerRmin, in: 0..1, step: 0.01 # Only integers inside in
    end
    f.actions
  end

end

#I was facing the same issue and tried using :disabled but it did not solve my problem as I wanted field value to be included in params object while sending it to the server. When you mark a form input as :input_html => {:disabled => true} , it does not include this field value in params. So, instead I used :input_html => {:readonly => true} which solved both of my problems:

   # Does not allow user to edit
   # Includes the value in params
