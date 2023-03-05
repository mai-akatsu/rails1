class UsersController < ApplicationController
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params.require(:user).permit(:title, :starttime, :endtime, :checkbox, :memo))
    if @user.save
      flash[:success] = "スケジュールの登録に成功しました"
      redirect_to :users
    else
      flash[:delete] = "スケジュールの登録に失敗しました"
      render "new"
    end
  end
  
  def show
    @user = User.find(params[:id])
    if @user.checkbox == true 
      puts "○"
    else
    end
  end

  def edit
     @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(params.require(:user).permit(:title, :starttime, :endtime, :checkbox, :memo))
    flash[:success] = "スケジュールを更新しました"
    redirect_to :users
    else
    flash[:delete] = "スケジュールの更新に失敗しました"
    render "edit"
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    def destroy
     @user = User.find(params[:id])
     @user.destroy
     flash[:success] = "スケジュールを削除しました"
     redirect_to :users
    end
  end
end
 
  def count
    @score = User.count
  end