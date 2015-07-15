class BooksController < ApplicationController
  def index
  	@author = Author.find_by_id params[:author_id]
  end

  def new
  	@book = Book.new
  	@author = Author.find params[:author_id]
  end

  def create
  	@author = Author.find params[:author_id]
  	@book = @author.books.create(book_params)

  			if @book.save
  				flash[:success] = "Successfully Created!"
  				redirect_to author_books_path
  			else
  				# show new page again with error messages. 
  				@errors = @book.errors.full_messages
  				render :new
  			end
  end


  def show
  	@book = Book.find_by_id params[:id] 
  end

  def edit
  	@book = Book.find params[:id]
  end

  def update
  	@book = Book.find params[:id]
  	@book.update(book_params)

  	if @book.save
  		flash[:success] = "Successfully Created!"
  		redirect_to author_books_path(@book.author)
  	else
  		@errors = @book.errors.full_messages
  		render :new
  	end
  end
  


  def destroy
  	@book = Book.find_by_id params[:id]
  	@book.destroy
  	redirect_to author_books_path(@book.author)
  end


  private
  def book_params
  	book_params = params.require(:book).permit(:title, :description)
  end

end
