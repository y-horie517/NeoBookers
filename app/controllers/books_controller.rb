class BooksController < ApplicationController

before_action :authenticate_user!

	def new
		@book = Book.new
	end
# createビューはないのでindexに記載
	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		if @book.save
			flash[:notice] = "Book was successfully created."
			redirect_to book_path(@book.id)
		else
			flash[:warning] = " Creation error."
			@books = Book.all
			redirect_to books_path
		end
	end

	def index
		@books = Book.all
		@book = Book.new
		@user = current_user
	end

	def show
		@book = Book.find(params[:id])
		# 画面の関係上,他とは違う変数で定義
		@booknew = Book.new
		@user = User.find(@book.user_id)
	end

	def destroy
		
	end


	private
		def book_params
			params.require(:book).permit(:title, :opinion, :image)
		end
end
