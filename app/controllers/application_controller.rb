class ApplicationController < ActionController::Base
	 # before_action :authenticate_user!
	 
	 # ログイン後にマイページに遷移させる
	 def after_sign_in_path_for(resource)
	 	mypage_path(resource)
	 end
end
