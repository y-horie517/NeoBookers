class UsersController < ApplicationController

before_action :authenticate_user!

  def show
  	@user = User.find(params[:id])
  	@book = Book.new
  	@books = @user.book.reverse_order
  end

  def index

  	@users = User.all
  	@book = Book.new
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	@user.update(user_params)
  	redirect_to user_path(@user.id), notice: t('edit successfully !')
  end

  private
  def user_params
  	params.require(:user).permit(:username, :profile_image, :Introduction)
  end

end
