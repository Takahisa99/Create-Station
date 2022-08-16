class Admin::CreatesController < ApplicationController
     before_action :authenticate_admin!, except: [:show, :index]

    def index
    #   @create = Create.find(create_params)
       @creates = Create.includes(:user).where(user: {is_deleted: false})
    end

    def show
       @create = Create.find(params[:id])
       @create.favorites.size
       #@user = @create.user.find(params[:id])
       #@user = User.find(params[create_params])
    end

    def edit
    end

    def update
    end

    def destroy
    end



   private
  def create_params
    params.require(:creates).permit(:name, :user_id )
  end

end
