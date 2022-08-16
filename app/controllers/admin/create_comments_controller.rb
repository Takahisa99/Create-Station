class Admin::CreateCommentsController < ApplicationController
  before_action :authenticate_admin!

   def index
   end


    def destroy
        @create_comments = CreateComment.find(params[:id])
        @create =Create.find(params[:create_id])
        CreateComment.find_by(id: params[:id], create_id: params[:create_id]).destroy
    end

   private

    # def create_comment_params
    # params.require(:create_comment).permit(:comment)
    # end


end
