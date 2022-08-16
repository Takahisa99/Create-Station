class Public::SearchesController < ApplicationController
  before_action :authenticate_user!


    def search
      @word = params[:word]
      @range = params[:range]
      if @range == "User"
        @users = User.looks(params[:word])
        render :result
      elsif @range == "Create"
        @creates = Create.looks(params[:word])
        render :result
      elsif @range == "Genre"
        @creates = Create.where(genre_id: params[:genre_id])
        render :result
      end
    end
end
