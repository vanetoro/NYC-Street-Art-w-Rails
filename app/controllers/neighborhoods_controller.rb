class NeighborhoodsController < ApplicationController
  layout 'logged_in'
  def index
    @neighborhoods = Neighborhood.all_hoods
  end

  def show
    @neighborhood = Neighborhood.find(params[:id])
    binding.pry
  end

  def top3
    @neighborhoods = Neighborhood.top_hoods
    render :index
  end

end
