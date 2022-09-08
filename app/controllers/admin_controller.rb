# frozen_string_literal: true

# Missing top-level documentation
#
class AdminController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]

	def index
    @users = User.all
  end

	def show
	end

	def edit
	end
	
	def update
		
		if @user.update(user_params)
			redirect_to @user
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
