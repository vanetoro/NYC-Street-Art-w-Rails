class MuralsController < ApplicationController
  layout 'logged_in'
  before_action :not_logged_in

  def index
    @murals = set_user.murals
    
   #  respond_to do |format|
   #   format.html { render :index }
   #   format.json { render json: }
   # end
  end

  def new
    @mural = Mural.new
  end

  def create
    @mural = Mural.new(mural_params)
    @mural.user = set_user
    if @mural.save
        redirect_to artist_path(@mural.artist)
    else
      render :new
    end
  end

  def show
    set_mural
    render json: @mural, status: 200
  end

  def edit
    set_mural
  end

  def update
    set_mural.update(mural_params)
    if @mural.save
      redirect_to artist_mural_path(@mural.artist, @mural)
    else
      render :edit
    end
  end

  def destroy
    set_mural
    @mural.destroy
    redirect_to artist_path(@mural.artist)
  end

  private

    def mural_params
      params.require(:mural).permit(:artist_id, :location_details, :neighborhood_id, :user_id, :avatar, :active,  neighborhood_attributes:[:name])
    end
end
