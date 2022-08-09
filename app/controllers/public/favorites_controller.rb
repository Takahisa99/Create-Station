class Public::FavoritesController < ApplicationController


  def create
    @create = Create.find(params[:create_id])
    @favorite = current_user.favorites.new(create_id: @create.id)
    @favorite.save
    redirect_to request.referer
  end



  def destroy
    @create = Create.find(params[:create_id])
    @favorite = current_user.favorites.find_by(create_id: @create.id)
    @favorite.destroy
    redirect_to request.referer
  end


#いいね一覧
  def favorites
    @user = User.find(params[:id])
    favorites= Favorite.where(user_id: @user.id).pluck(:create_id)
    @favorite_creates = Create.find(favorites)
  end



end
