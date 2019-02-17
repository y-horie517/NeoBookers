class UsersController < ApplicationController

before_action :authenticate_user!
# 編集画面表示、修正内容の更新アクション実行時はログインしているユーザーの場合のみ実行可とする。
before_action :correct_user, only: [:edit, :update]

  def show
  	@user = User.find(params[:id])
  	@book = Book.new
  	@books = @user.book.reverse_order
  end

  def index

  	@users = User.all
  	@book = Book.new
    @user = current_user
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
      flash[:notice] = 'User info was edited successfully !'
    else
      flash[:warning] = 'edit error!'
    end

  	redirect_to user_path(@user.id)
  end

  private
  def user_params
  	params.require(:user).permit(:username, :profile_image, :Introduction)
  end

  def correct_user
    user = User.find(params[:id])
    if current_user != user
      flash[:warning] = "page error."
      redirect_to root_path
    end
  end

end
