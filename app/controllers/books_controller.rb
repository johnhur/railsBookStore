class BooksController < ApplicationController
	before_action :find_author, only: [:index, :new, :create]
	before_action :find_book, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
  	@book = Book.new
  	
  end

  def create
  	
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
  	
  end

  def edit
  end

  def update
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
  	@book.destroy
  	redirect_to author_books_path(@book.author), notice: "#{@book.title} has been removed :("
  end


  private
  def find_author
  	@author = Author.find params[:author_id]
  end

  def find_book
  	@book = Book.find params[:id]
  end

  def book_params
  	book_params = params.require(:book).permit(:title, :description)
  end

end
