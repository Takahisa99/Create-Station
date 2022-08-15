class Admin::CreateCommentsController < ApplicationController
  before_action :authenticate_user!
　#before_action :if_not_admin
　  #before_action :set_tweet, only: [:index, :new, :create, :show, :edit, :destroy]

   def index
   end


    def destroy
        @create_comments = CreateComments.find(params[:id])
    end
end
