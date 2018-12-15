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
    if params[:year] == "All"
      @meteorites = Meteorite.where("name LIKE :prefix", prefix: "#{params[:letter]}%")
    else
      @meteorites = Meteorite.where("name LIKE :prefix", prefix: "#{params[:letter]}%").where(year: params[:year])
    end
    puts "&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&"
    puts params[:letter]

    respond_to do |format|
      format.json { render json: {"meteorites" => @meteorites} }
    end
  end

  def about
  end
end
