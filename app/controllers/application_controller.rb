class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

	def after_sign_in_path_for(resource)
		if Role.find(resource.role_id).name === 'admin'
			admin_root_path
		elsif Role.find(resource.role_id).name === 'moderator'
		  	data_root_path
		else
		  	'/'
		end
	end

	def ensure_moderator!
	  unless current_user and Role.find(current_user.role_id).name === 'moderator'
	    if Role.find(current_user.role_id).name === 'admin'
	      redirect_to(admin_root_path, flash: {:error => 'You don\'t have access to reach that Page!'})
	    else
	      redirect_to('/')
	    end
	  end
	end

	def ensure_admin!
	  unless current_user and Role.find(current_user.role_id).name === 'admin'
	    if Role.find(current_user.role_id).name === 'moderator'
	      redirect_to(data_root_path, flash: {:error => 'You don\'t have access to reach that Page!'})
	    else
	      redirect_to('/')
	    end
	  end
	end
end
