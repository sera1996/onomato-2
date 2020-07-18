class FavorsController < ApplicationController
  before_action :set_favor, only: [:show, :edit, :update, :destroy]

  # GET /favors
  # GET /favors.json
  def index
    @favors = Favor.all
  end

  # GET /favors/1
  # GET /favors/1.json
  def show
  end

  # GET /favors/new
  def new
    @favor = Favor.new
  end

  # GET /favors/1/edit
  def edit
  end

  # POST /favors
  # POST /favors.json
  def create
    @favor = Favor.new(favor_params)
    @survey = Survey.find(@favor.survey_id)
    #binding.pry
    case @favor.dimension_name
    when "cemboss" then
      @survey.emboss = true
      @survey.save
    when "dfavor" then
      @survey.favor = true
      @survey.save
    when "ghardness" then
      @survey.hardness = true
      @survey.save
    when "fwetness" then
      @survey.wetness = true
      @survey.save
    when "eelastic" then
      @survey.elastic = true
      @survey.save
    when "aadhesive" then
      @survey.adhesive = true
      @survey.save
    when "bfriction" then
      @survey.friction = true
      @survey.save

    end
    #binding.pry
    respond_to do |format|
      if @favor.save
        format.html { redirect_to @favor, notice: 'Favor was successfully created.' }
        format.json { render :show, status: :created, location: @favor }
      else
        format.html { render :new }
        format.json { render json: @favor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /favors/1
  # PATCH/PUT /favors/1.json
  def update
    respond_to do |format|
      if @favor.update(favor_params)
        format.html { redirect_to @favor, notice: 'Favor was successfully updated.' }
        format.json { render :show, status: :ok, location: @favor }
      else
        format.html { render :edit }
        format.json { render json: @favor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /favors/1
  # DELETE /favors/1.json
  def destroy
    @favor.destroy
    respond_to do |format|
      format.html { redirect_to favors_url, notice: 'Favor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favor
      @favor = Favor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def favor_params
      params.require(:favor).permit(:survey_id,:sara,:sube,:tsuru,:deko,:gasa,:zara,:fuwa,:buwa,:buyo,:puru,:gunya,:fuka,:funya,:muchi,:gotsu,:gowa,:kachi,:beta,:beto,:becho,:bisho,:bicha,:gusho,:jiku,:boso,:poso,:kasa,:pasa,:neba,:nechi,:neto,:necha,:nume,:nuru,:nyuru,:gito,:dimension_name)
    end
end
