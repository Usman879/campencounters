class Admin::UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]

	def index
    if params[:search_key]
      @users = User.where("LOWER(first_name) LIKE ? OR LOWER(email) LIKE ? " , 
      "%#{params[:search_key]}%", "%#{params[:search_key]}%")
    else  
      @users = User.all
    end
  
  end

  def new
    @user=User.new
  end

  def create
    @user=User.new(user_params)
    if @user.save
      redirect_to admin_users_path
    else
      render 'new'
    end
  end

	def show
	end

	def edit
	end
	
	def update
		if @user.update(user_params)
			redirect_to admin_user_path
		else
			render 'edit'
		end
	
	end

	def destroy
		@user.destroy
		redirect_to root_path
	end


	private

	def find_user
    @user = User.find(params[:id])
  end

	def user_params
    params.require(:user).permit(:id, :first_name, :last_name, :email, :phone_number, :country, :type)
  end

end
