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

  def sign_in_with_password
    @user = User.find_by(username: params[:user][:username])
      if !@user.nil? && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to artists_path
      else
        flash[:error] = 'Username or password is incorrect. Please try again.'
        @user = User.new
        render :new
      end
  end

  def sign_in_with_auth(auth)
    @user = User.find_by(email: auth[:info][:email])
      if @user.blank?
        @user = User.new(email: auth[:info][:email]) do |u|
          u.username = auth['info']['email'].split('@')[0]
          u.email = auth['info']['email']
          u.password = SecureRandom.hex
          @user.save
        end
      end
      session[:user_id] = @user.id
      redirect_to artists_path
  end


end
