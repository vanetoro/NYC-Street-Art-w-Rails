class UsersController < ApplicationController
  layout 'logged_in', only: :edit


  def new
    logged_in
    @user = User.new
  end

  def edit
    set_user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to artists_path
    else
      render :new
    end
  end

  def update
    if params[:password].blank?
      set_user.skip_password_validation = true
    end
      @user.update(user_params)
    if @user.save
      redirect_to artists_path
    else
      render :edit
    end
  end

  private

    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation, :email)
    end
end
