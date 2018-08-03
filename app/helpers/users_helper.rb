module UsersHelper

  def set_user
    @user ||= User.find_by_id(session[:user_id])
  end


  # def is_admin?
  #   if @user.admin = 1
  #     true
  #   else
  #     false
  #   end
  # end

  def delete_mural
    if set_user.admin == 1
      link_to 'Delete' ,dle
    end
  end
end
