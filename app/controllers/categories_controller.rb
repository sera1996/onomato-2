class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_account!

  # GET /categories
  # GET /categories.json
  def python
    #binding.pry
    a = system("python text_ruigi.py")
  end
  def word2vec
    @relative = system("python text_ruigi.py#{category_params}")
    redirect_to "/python"
  end
  def index
    @categories = Category.all
    #binding.pry
    category = Category.all
    #personal = {'name' => 'Yamada', 'old' => 28}
    respond_to do |format|
      format.html{render :index}
      format.json{render json: category, include: ["onomatopoeium"]}
    end
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    #binding.pry
    #response = Array.new
    #@category.onomatopoeium.each do |onomatopoeia|
    #  response.push(onomatopoeia.name)
    #end
    #render :json => response.to_json
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def category_params
      params.require(:category).permit(:name,:image)
    end
end
