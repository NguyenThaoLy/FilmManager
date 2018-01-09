module UsersHelper
   def logged_in_user
      unless logged_in?
        flash[:danger] = t :please
        redirect_to login_url
      end
    end
end
