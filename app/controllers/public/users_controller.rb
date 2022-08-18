class Public::UsersController < ApplicationController

  before_action :ensure_correct_user, only: [:update,:edit]
  before_action :ensure_guest_user, only: [:edit]


#会員の一覧

  def index
    @users = User.page(params[:page]).per(9)
    @create = Create.new
    @user = current_user
  end


#会員の情報
  def show
    @user = User.find(params[:id])
    @creates = @user.creates
    @create = Create.new

    #@total_creates = Create.count
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

#いいね一覧
  def favorites
    @user = User.find(params[:id])
    favorites = Favorite.where(user_id: @user.id).pluck(:create_id)
    @favorite_creates = Create.find(favorites)
  end

#退会機能

  def unsubscribe
  end


  def withdrawal
    @user = current_user
    @user.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end



   private

  def user_params
    params.require(:user).permit(:name, :email, :profile_image, :introduction )
  end

#ゲストユーザー
  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.name == "guestuser"
      redirect_to public_user_path(current_user) , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'

    end
  end



  def ensure_correct_user

    @user = User.find(params[:id])
    redirect_to public_users_path unless @user == current_user

  end
end
