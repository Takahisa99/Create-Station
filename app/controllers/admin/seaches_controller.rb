class Admin::SeachesController < ApplicationController
before_action :authenticate_admin!


    def search
      @word = params[:word]
      @range = params[:range]
      if @range == "Create"
         @creates = Create.looks(params[:word])
        render :result
      elsif @range == "Genre"
        @creates = Create.where(genre_id: params[:genre_id])
        render :result
      elsif selection = params[:word]
        @creates = Create.sort(selection)
        render :result
      end

    end
end




end
