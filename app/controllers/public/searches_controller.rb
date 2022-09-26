class Public::SearchesController < ApplicationController
  before_action :authenticate_user!


    def search
      @word = params[:word]
      @range = params[:range]
       #byebug
      if @range == "User"
        @users = User.looks(params[:word])
        render :result
      elsif @range == "Create"
        @creates = Create.looks(params[:word])
        render :result
      elsif @range == "Genre"
        @creates = Create.where(genre_id: params[:genre_id])
        render :result
      else
        selection = params[:keyword]
        #@creates = Create.sort(selection)
        #@creates = Create.order(:created_at)
        case selection
        when 'new'
          @creates = Create.all.order(created_at: :DESC)
        when 'old'
          @creates = Create.all.order(created_at: :ASC)
        when 'likes'

          #favorites = Favorite.group(:create_id).order(Arel.sql('count(create_id) desc')).pluck(:create_id)
          #@creates = Create.find(favorites)

          @creates = Create.find(Favorite.group(:create_id).order(Arel.sql('count(create_id) desc')).pluck(:create_id))
        when 'dislikes'
          @creates = Create.find(Favorite.group(:create_id).order(Arel.sql('count(create_id) asc')).pluck(:create_id))
        end
          render 'public/creates/index'
      end

    end
end
