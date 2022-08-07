class Public::CreatesController < ApplicationController

#作品一覧
  def index
    @creates = Create.all
    @create = Create.new

  end

#作品詳細
  def show
    @create = Create.find(params[:id])
    @user = @create.user
  end

#投稿投稿
  def create
    @creates = Create.all
    @create = Create.new(create_params)
    @create.user_id = current_user.id
    if @create.save
      flash[:notice]= "You have created book successfully."
      redirect_to create_path(@create)
    else
       @user = current_user

      render :index
    end
  end


#作品情報編集
  def edit
    @create = Create.find(params[:id])
  end


  def create_params
    params.require(:create).permit(:name, :introduction, :image)
  end


end
