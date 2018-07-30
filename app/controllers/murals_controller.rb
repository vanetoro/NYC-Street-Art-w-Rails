class MuralsController < ApplicationController

  def index
    binding.pry
    @murals = Mural.all
  end
end
