class MeteoritesController < ApplicationController
  before_action :set_meteorite, only: [:show, :edit, :update, :destroy]

  # GET /meteorites
  # GET /meteorites.json
  def index
    @meteorites = Meteorite.all
  end

  # GET /meteorites/1
  # GET /meteorites/1.json
  def show
  end

  # GET /meteorites/new
  def new
    @meteorite = Meteorite.new
  end

  # GET /meteorites/1/edit
  def edit
  end

  # POST /meteorites
  # POST /meteorites.json
  def create
    @meteorite = Meteorite.new(meteorite_params)

    respond_to do |format|
      if @meteorite.save
        format.html { redirect_to @meteorite, notice: 'Meteorite was successfully created.' }
        format.json { render :show, status: :created, location: @meteorite }
      else
        format.html { render :new }
        format.json { render json: @meteorite.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meteorites/1
  # PATCH/PUT /meteorites/1.json
  def update
    respond_to do |format|
      if @meteorite.update(meteorite_params)
        format.html { redirect_to @meteorite, notice: 'Meteorite was successfully updated.' }
        format.json { render :show, status: :ok, location: @meteorite }
      else
        format.html { render :edit }
        format.json { render json: @meteorite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meteorites/1
  # DELETE /meteorites/1.json
  def destroy
    @meteorite.destroy
    respond_to do |format|
      format.html { redirect_to meteorites_url, notice: 'Meteorite was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meteorite
      @meteorite = Meteorite.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meteorite_params
      params.require(:meteorite).permit(:name, :class, :mass, :year, :latitude, :longitude)
    end
end
