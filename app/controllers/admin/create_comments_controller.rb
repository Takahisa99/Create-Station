class Admin::CreateCommentsController < ApplicationController
#  before_action :authenticate_user!も必要なら書いてください！
　#before_action :if_not_admin
　  #before_action :set_tweet, only: [:index, :new, :create, :show, :edit, :destroy]

   def index
   end


    def destroy
        @create_comments = CreateComments.find(params[:id])
    end

　　private
　　def if_not_admin
　　redirect_to root_path unless current_user.admin?
　　end

　　def set_tweet\
　　@tweet = Tweet.find(params[:id])
　　end
end
