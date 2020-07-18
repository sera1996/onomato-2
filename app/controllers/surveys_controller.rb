require 'pca'
require 'gnuplot'
require 'json'
class SurveysController < ApplicationController
  before_action :set_survey, only: [:show, :edit, :update, :destroy]

  # GET /surveys
  # GET /surveys.json
  def index
    @surveys = Survey.all
    #binding.pry
  end

  # GET /surveys/1
  # GET /surveys/1.json
  def show
    if @survey.emboss == true && @survey.favor == true && @survey.hardness == true && @survey.wetness == true && @survey.elastic == true && @survey.adhesive == true && @survey.friction == true
      a = Array.new(7) do
        Array.new(36)
      end
      @survey.favors.each_with_index do |favor,i|
        a[i][0] = favor.as_json.to_a[40][1]
        36.times do |j|
          a[i][j+1] = favor.as_json.to_a[j+2][1]
        end
      end
      a = a.sort!
      a.each do |axis|
        axis.delete_at(0)
      end

      b = Array.new(36) do
        Array.new(7)
      end

      36.times do |i|
        7.times do |j|
          b[i][j] = a[j][i]
        end
      end

      pca = PCA.new components:2
      transformed = pca.fit_transform b
      transformed = transformed.to_a
      float_round = Array.new(36) do
        [0,0]
      end

      float_round_x = []
      float_round_y = []
  #p float_round
      transformed.each_with_index do |row,i|
        row.each_with_index do |column,j|
          if j == 0
            float_round_x.push(column.round(3)*-1)
          elsif j == 1
            float_round_y.push(column.round(3)*-1)
          end
        end
      end
  #json_obj = []
      result = []
  #float_round.each do |float|
  #    json_obj << float.to_json
  #end
      result1 = []
      result2 = []
      result1.push(float_round_x).flatten!
      result2.push(float_round_y).flatten!
      float_round_x.each_with_index do |data,i|
        result.push("{x:#{data},y:#{float_round_y[i]}}")
      end
      res = result.join("+")
      #binding.pry
      @result = res
      @result1 = result1
      @result2 = result2
      p @result1
      p @result2
      #binding.pry
      p result
    end

    # GET /surveys/new
    def new
      @survey = Survey.new
    end

    # GET /surveys/1/edit
    def edit
    end

    # POST /surveys
    # POST /surveys.json
    def create
      @survey = Survey.new(survey_params)

      respond_to do |format|
        if @survey.save
          format.html { redirect_to @survey, notice: 'Survey was successfully created.' }
          format.json { render :show, status: :created, location: @survey }
        else
          format.html { render :new }
          format.json { render json: @survey.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /surveys/1
  # PATCH/PUT /surveys/1.json
  def update
    respond_to do |format|
      if @survey.update(survey_params)
        format.html { redirect_to @survey, notice: 'Survey was successfully updated.' }
        format.json { render :show, status: :ok, location: @survey }
      else
        format.html { render :edit }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /surveys/1
  # DELETE /surveys/1.json
  def destroy
    @survey.destroy
    respond_to do |format|
      format.html { redirect_to surveys_url, notice: 'Survey was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey
      @survey = Survey.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def survey_params
      params.fetch(:survey, {})
    end
end
