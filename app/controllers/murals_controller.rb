class MuralsController < ApplicationController

  def index
    @murals = Mural.all
  end

  def new
    @mural = Mural.new
  end

  def create
    @mural = Mural.new(mural_params)
    if @mural.save
        redirect_to artist_path(@mural.artist)
    else
      render :new
    end
  end

  private

    def mural_params
      params.require(:mural).permit(:artist_id, :name, :neighborhood_id, neighborhood_attributes:[:name])
    end
end
