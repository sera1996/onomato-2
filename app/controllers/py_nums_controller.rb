class PyNumsController < ApplicationController
    def python
        
        #a = `python text_ruigi.py `
        #@b = a.split(" ")
        @pynum = PyNum.new
        #binding.pry
    end
    def word2vec
        one = pynum_params[:sentence]
        two = pynum_params[:vocab]
        #system("python text_ruigi.py #{one} #{two}")
        test = `python text_ruigi.py "#{one}" "#{two}"`.split(" ")
        redirect_to controller: "py_nums", action: "python", result: test[0]
        #binding.pry
=begin
        @pynum = PyNum.new(pynum_params)

        respond_to do |format|
          if @pynum.save
            format.html { redirect_to "localhost:3000/word2vec_sentence", notice: 'Category was successfully created.' }
            format.json { render :show, status: :created, location: @pynum }
          end
        end
=end
    end
    def visuword
        @pynum = PyNum.new
    end
    private
        # Use callbacks to share common setup or constraints between actions.
        def set_pynum
            @py_num = PyNum.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def pynum_params
            params.permit(:sentence,:vocab)
        end
end
