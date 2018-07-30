class MuralsController < ApplicationController

  def index
    @murals = Mural.all
  end

  def new
    @mural = Mural.new
  end

  def create
    binding.pry
  end

  private

    def mural_params
      params.require(:mural).permit(:artist_id, :neighborhood_id)
    end
end
