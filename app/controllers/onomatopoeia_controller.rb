class OnomatopoeiaController < ApplicationController
  before_action :set_onomatopoeium, only: [:show, :edit, :update, :destroy]

  # GET /onomatopoeia
  # GET /onomatopoeia.json
  def index
    @onomatopoeia = Onomatopoeium.order(:category_id).all
    #binding.pry
  end

  # GET /onomatopoeia/1
  # GET /onomatopoeia/1.json
  def show
    #binding.pry
  end

  # GET /onomatopoeia/new
  def new
    unless params[:id].nil?
      @category = Category.find(params[:id])
    end
    @onomatopoeium = Onomatopoeium.new
    @onomatopoeium.samples.build
    #binding.pry
  end

  # GET /onomatopoeia/1/edit
  def edit
    #@onomatopoeium.samples.build
  end

  # POST /onomatopoeia
  # POST /onomatopoeia.json
  def create
    #binding.pry
    @category = Category.find(onomatopoeium_params[:category_id])
    #@onomatopoeium = Onomatopoeium.new(onomatopoeium_params)
    @onomatopoeium = @category.onomatopoeium.new(onomatopoeium_params)

    respond_to do |format|
      if @onomatopoeium.save
        format.html { redirect_to "/categories/#{onomatopoeium_params[:category_id]}", notice: 'Onomatopoeium was successfully created.' }
        format.json { render :show, status: :created, location: @onomatopoeium }
      else
        format.html { render :new }
        format.json { render json: @onomatopoeium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /onomatopoeia/1
  # PATCH/PUT /onomatopoeia/1.json
  def update
    @onomatopoeia = Category.find(onomatopoeium_params[:category_id]).onomatopoeium.where(id:onomatopoeium_params[:id])
    respond_to do |format|
      if @onomatopoeia.update(onomatopoeium_params)
        format.html { redirect_to @onomatopoeium, notice: 'Onomatopoeium was successfully updated.' }
        format.json { render :show, status: :ok, location: @onomatopoeium }
      else
        format.html { render :edit }
        format.json { render json: @onomatopoeium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /onomatopoeia/1
  # DELETE /onomatopoeia/1.json
  def destroy
    @onomatopoeium.destroy
    respond_to do |format|
      format.html { redirect_to onomatopoeia_url, notice: 'Onomatopoeium was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_onomatopoeium
      @onomatopoeium = Onomatopoeium.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def onomatopoeium_params
      params.require(:onomatopoeium).permit(:name,:category_id,:description,:id,:kana,:example,samples_attributes:[:id,:onomatopoeium_id,:sentence])
    end
end
