class BooksController < ApplicationController

before_action :authenticate_user!

	def new
		@book = Book.new
	end
# createビューはないのでindexに記載
	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		@book.save
		flash[:notice] = "Book was successfully created."
		redirect_to book_path(@book.id)
	end

	def index
		@books = Book.all
		@book = Book.new
		
	end

	def show
		@book = Book.find(params[:id])
	end


	private
		def book_params
			params.require(:book).permit(:title, :opinion, :image)
		end
end
