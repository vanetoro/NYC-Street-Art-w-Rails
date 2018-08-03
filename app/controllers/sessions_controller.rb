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


end
