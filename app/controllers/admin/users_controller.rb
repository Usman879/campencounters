# frozen_string_literal: true

class Admin::UsersController < ApplicationController
  before_action :find_user, only: %i[show edit update destroy]
  helper_method :sort_column, :sort_direction

  def index
    if params[:search_key]
      @users = User.where('LOWER(first_name) LIKE ? OR LOWER(email) LIKE ? ',
                          "%#{params[:search_key]}%", "%#{params[:search_key]}%").page(params[:page])
    else
      @users = User.order(sort_column + ' ' + sort_direction)
      @users = User.order(:id).page(params[:page])
      respond_to do |format|
        format.html
        format.csv { send_data @users.to_csv }
      end
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.welcome_email(@user).deliver_now
      redirect_to admin_users_path, notice: 'User Successfully Created.'
    else
      render 'new', notice: 'Fields are missing.'
    end
  end

  def show
    if current_user.type? == 'Admin'
      render 'users#index'
    elsif current_user.type? == 'SuperAdmin'
      render 'users#index'
    else
      redirect_to root_path
    end
  end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to admin_user_path
    else
      render 'edit', notice: 'User Successfully Updated.'
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
    params.require(:user).permit(
      :id,
      :first_name,
      :last_name,
      :email,
      :phone_number,
      :password,
      :country,
      :type,
      :image
    )
  end

  def sort_column
    params[:sort] || 'fname'
  end

  def sort_direction
    params[:direction] || 'asc'
  end
end
