class Public::UsersController < ApplicationController

  #before_action :ensure_correct_user, only: [:update,:edit]

#会員の一覧

  def index
    @users = User.all
    @create = Create.new
    @user = current_user
  end


#会員の情報
  def show
    @user = User.find(params[:id])
    @creates = @user.creates
    @create = Create.new
  end


#会員の情報編集
  def edit
    @user = User.find(params[:id])
  end

#会員の情報更新
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice]="更新しました！"
      redirect_to public_user_path(@user)
    else
      render :edit
    end
  end


   private

  def user_params
    params.require(:user).permit(:name, :email, :profile_image)
  end



end
