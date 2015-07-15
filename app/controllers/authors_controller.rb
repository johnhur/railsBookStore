class AuthorsController < ApplicationController
  def index
  	@authors = Author.all
  end

  def new
  	@author = Author.new
  end

  def create
  	@author = Author.create(author_params)

  			if @author.save
  				flash[:success] = "Successfully Created!"
  				redirect_to authors_path
  			else
  				# show new page again with error messages. 
  				@errors = @author.errors.full_messages
  				render :new
  			end

  end


  def show
  	@author = Author.find_by_id params[:id]
  end

  def edit
  	@author = Author.find_by_id params[:id]
  end

  def update
  	@author = Author.find_by_id params[:id]
  	@author.update(author_params)
  	if@author.save
  		flash[:success] = "Successfully Updated!"
  		redirect_to authors_path
  	else
  		@errors = @author.errors.full_messages
  		render :edit
  	end
  end

  def destroy
  	@author = Author.find_by_id params[:id]
  	@author.destroy
  	redirect_to authors_path, notice: "#{@author[:first_name]} was deleted from this application :("
  end

  private
    	def author_params
  			author_params = params.require(:author).permit(:first_name, :last_name, :age)
  		end
end
