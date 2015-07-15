class AuthorsController < ApplicationController

	before_action :find_author, only: [:show, :edit, :update, :destroy]

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
  	
  end

  def edit
  	
  end

  def update
  	
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
  	
  	@author.destroy
  	redirect_to authors_path, notice: "#{@author[:first_name]} was deleted from this application :("
  end

  private
  		def find_author
  			@author = Author.find_by_id params[:id]
  		end

    	def author_params
  			author_params = params.require(:author).permit(:first_name, :last_name, :age)
  		end
end
