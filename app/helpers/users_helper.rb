module UsersHelper

  def set_user
    @user ||= User.find_by_id(session[:user_id])
  end

  def delete_artist
    if set_user.admin == 1
      link_to 'Delete Artist', artist_path(set_artist), method: :delete
    end
  end

  def delete_mural
    if set_user.admin == 1
      link_to 'Delete', mural_path(set_mural), method: :delete
    end
  end
end
