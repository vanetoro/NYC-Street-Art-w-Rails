class ApplicationController < ActionController::Base
  helper_method :set_artist, :set_mural

  def welcome

  end

  def set_artist
    @artist = Artist.find(params[:id])
  end

  def set_mural
    @mural = Mural.find(params[:id])
  end

  def set_user
    @user ||= User.find_by_id(session[:user_id])
  end
end
