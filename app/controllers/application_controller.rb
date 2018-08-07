class ApplicationController < ActionController::Base
  helper_method :set_artist, :set_mural, :logged_in
  layout 'logged_in', only: :history

  def welcome
  end

  def history
  end

  def logged_in
    if !!set_user
      redirect_to artists_path
    end
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

  def is_admin?
    if @user.admin = 1
      true
    else
      false
    end
  end




end
