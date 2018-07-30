class MuralsController < ApplicationController

  def index
    @murals = Mural.all
  end

  def new
    @mural = Mural.new
  end
end
