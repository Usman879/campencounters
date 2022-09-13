class Admin::CampsController < ApplicationController

  before_action :find_camp, only: [:show, :edit, :update, :destroy]

  def index

    if params[:search_key]
      @camps = Camp.where("LOWER(title) LIKE ?" , 
      "%#{params[:search_key]}%")
    else
      @camps = Camp.all
    end
  end

  def new
    @camp = Camp.new
  end

  def create
    @camp = Camp.new
    if @camp.save
      redirect_to admin_camps_path , notice: "Camp Successfully Created."
    else
      render 'new', notice: "Fields are missing."
    end
  end

  def show
  end

  def edit
  end

  def update
    if @camp.update(camp_params)
			redirect_to admin_camp_path
		else
			render 'edit' , notice: "Camp Successfully Updated."
		end
  end

  def destroy
    @camp.destroy
		redirect_to admin_camps_path
  end

  private

  def find_camp
    @camp = Camp.find(params[:id])
  end

	def camp_params
    params.require(:camp).permit(
      :id, :title, :locations, :camp_type, :camp_status, 
      :applicant_registration_start_date, :applicant_registration_start_time,
      :applicant_registration_end_date, :applicant_registration_end_time
      :parent_application_start_date, :parent_application_start_time,
      :parent_application_end_date, :parent_application_end_time)
  end

end
