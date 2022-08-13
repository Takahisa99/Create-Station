class Admin::UserController < ApplicationController
  #before_action :authenticate_admin!

  def index
    @users = User.page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])


  end

#   def edit
#     @customer = Customer.find(params[:id])
#   end

#   def update
#     @customer = Customer.find(params[:id])
#     if @customer.update(customer_params)
#       redirect_to admin_customer_path(@customer)
#     end
#   end

#   private
#   def customer_params
#     params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postcode, :address, :phone_number, :email, :is_deleted )
#   end
end