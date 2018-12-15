class HomeController < ApplicationController
  def home
  end

  def refreshHomeData
    @meteorites = Meteorite.all
    respond_to do |format|
      format.json { render json: {"meteorites" => @meteorites} }
    end
  end

  def about
  end
end
