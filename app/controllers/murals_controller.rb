class MuralsController < ApplicationController
  layout 'logged_in'

  def index
    @murals = Mural.all
  end

  def new
    @mural = Mural.new
  end

  def create
    @mural = Mural.new(mural_params)
    binding.pry
    # @mural.user = set_user.id
    if @mural.save
        redirect_to artist_path(@mural.artist)
    else
      render :new
    end
  end

  def show
    set_mural
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


  private

    def mural_params
      params.require(:mural).permit(:artist_id, :location_details, :neighborhood_id, :user_id, :avatar, neighborhood_attributes:[:name])
    end
end
