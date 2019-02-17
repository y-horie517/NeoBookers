class ApplicationController < ActionController::Base
	 # before_action :authenticate_user!


	#before_filterを設定
  	before_action :configure_permitted_parameters, if: :devise_controller?


	 # ログイン後にマイページに遷移させる
	 def after_sign_in_path_for(resource)
	 	mypage_path(resource)
	 end

	 protected

 	def configure_permitted_parameters
    #strong parametersを設定し、usernameを許可
    	devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation) }
    	devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:username, :password, :remember_me) }
  	end


end
