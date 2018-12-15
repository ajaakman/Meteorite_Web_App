class HomeController < ApplicationController
  def home

    @meteoritesData = Array.new
    @meteoriteName = Array.new
    @meteoriteFragmentsSold = Array.new
    @meteoriteWeightSold = Array.new
    @meteoriteValue = Array.new
    @orders = Order.all

    @orders.each do |order|
      if order.completed == true
        if @meteoriteName.index(order.posting.meteorite.name) == nil
          @meteoriteName << order.posting.meteorite.name
          @meteoriteFragmentsSold << 1
          @meteoriteWeightSold << order.posting.weight
          @meteoriteValue << order.posting.cost
        else
          @meteoriteFragmentsSold[@meteoriteName.index(order.posting.meteorite.name)] += 1
          @meteoriteWeightSold[@meteoriteName.index(order.posting.meteorite.name)] += order.posting.weight
          @meteoriteValue[@meteoriteName.index(order.posting.meteorite.name)] += order.posting.cost
        end
      end
    end
    @meteoritesData << @meteoriteName << @meteoriteFragmentsSold << @meteoriteWeightSold << @meteoriteValue
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
