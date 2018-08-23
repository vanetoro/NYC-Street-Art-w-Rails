class SessionsController < ApplicationController
  helper SessionsHelper

  def create
    auth = request.env["omniauth.auth"]
    if auth
      sign_in_with_auth(auth)
    else
      sign_in_with_password
    end
  end

  def new
    logged_in
    @user = User.new
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  private

  def sign_in_with_password
    @user = User.find_by(username: params[:user][:username].downcase)
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
      if @user.nil?
        @user = User.new(email: auth[:info][:email]) do |u|
          u.username = auth['info']['email'].split('@')[0]
          u.email = auth['info']['email']
          u.password = SecureRandom.hex
          u.password_confirmation = u.password
          u.save
        end
      end
      session[:user_id] = @user.id
      redirect_to artists_path
  end


end
