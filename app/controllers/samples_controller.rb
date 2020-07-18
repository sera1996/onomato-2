class SamplesController < ApplicationController
    before_action :set_sample, only: [:show, :edit, :update, :destroy]
    def index
        @samples = Sample.all
    #binding.pry
    end

  # GET /categories/1
  # GET /categories/1.json
    def show
    end

  # GET /categories/new
    def new
      @sample = Sample.new
    end

  # GET /categories/1/edit
    def edit
    end

  # POST /categories
  # POST /categories.json
    def create
        @sample = Sample.new(sample_params)

        respond_to do |format|
        if @sample.save
            format.html { redirect_to @sample, notice: 'sample was successfully created.' }
            format.json { render :show, status: :created, location: @sample }
        else
            format.html { render :new }
            format.json { render json: @sample.errors, status: :unprocessable_entity }
        end
        end
    end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
    def update
        respond_to do |format|
        if @sample.update(sample_params)
            format.html { redirect_to @sample, notice: 'Sample was successfully updated.' }
            format.json { render :show, status: :ok, location: @sample }
        else
            format.html { render :edit }
            format.json { render json: @sample.errors, status: :unprocessable_entity }
        end
        end
    end

  # DELETE /categories/1
  # DELETE /categories/1.json
    def destroy
        @sample.destroy
        respond_to do |format|
        format.html { redirect_to categories_url, notice: 'Sample was successfully destroyed.' }
        format.json { head :no_content }
        end
    end

    
    private
    # Use callbacks to share common setup or constraints between actions.
      def set_sample
          @sample = Sample.find(params[:id])
      end

    # Only allow a list of trusted parameters through.
      def sample_params
          params.require(:sample).permit(:sentence,:onomatopoeia_id)
      end
end
