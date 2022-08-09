class Public::CreatesController < ApplicationController

#ログインユーザー以外は下記の動作はできない
 before_action :ensure_correct_user, only: [:update,:edit]

#作品一覧
  def index
    @creates = Create.page(params[:page]).per(6)
    @create = Create.new
    @total_creates = Create.count

  end

#作品詳細
  def show
    @create = Create.find(params[:id])
    @creates = Create.all
    @create_comment = CreateComment.new
    #@user = @create.user
    @user = User.find(@create.user_id)
  end

#新規投稿
  def create
    @creates = Create.all
    @create = Create.new(create_params)
    @create.user_id = current_user.id
    if @create.save
      flash[:notice]= "投稿しました！"
      redirect_to public_create_path(@create)
    else
       @user = current_user

      render :index
    end
  end

  def new
    @create = Create.new
  end


#作品情報編集
  def edit
    @create = Create.find(params[:id])
  end

#作品情報更新
  def update
    @create = Create.find(params[:id])
    if @create.update(create_params)
      redirect_to public_create_path
    else
      render :edit
    end
  end

#作品削除
  def destroy
    @create = Create.find(params[:id])
    @create.destroy
    redirect_to public_user_path(current_user)
  end

  private

  def create_params
    params.require(:create).permit(:name, :introduction, :image)
  end


  def ensure_correct_user
    @create = Create.find(params[:id])
     unless @create.user == current_user
       redirect_to public_creates_path
     end
  end

end
