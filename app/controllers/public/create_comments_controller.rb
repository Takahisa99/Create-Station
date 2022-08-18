class Public::CreateCommentsController < ApplicationController
   before_action :authenticate_user!

  def create
    @create = Create.find(params[:create_id])
    @comment = current_user.create_comments.new(create_comment_params)
    @comment.create_id = @create.id
    @comment.save
    #edirect_to request.referer
  end

  def destroy
    @create =Create.find(params[:create_id])
    CreateComment.find_by(id: params[:id], create_id: params[:create_id]).destroy
    #redirect_to request.referer
  end

   private

  def create_comment_params
    params.require(:create_comment).permit(:comment)
  end

end
