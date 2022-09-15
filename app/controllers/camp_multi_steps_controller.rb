class CampMultiStepsController < ApplicationController
  include Wicked::Wizard

  before_action :camp_validity, only: %i[update]

    steps :select_camp, :introduction, :screen_1, :screen_2, :screen_3, :screen_4, 
    :screen_5, :screen_6, :screen_7, :screen_8

    def show
      @user = current_user
      @camps = Camp.active
      @camp = Camp.new
      render_wizard
    end

    def update
      @user = current_user
      @user.update(user_params) if wizard_steps.include?(step)

      sign_in(@user, bypass: true)
      render_wizard
    end

    def wicked_finish;end

    private

    def user_params
      params.require(:user).permit(
        :first_name, :last_name, 
        :phone, :country, :email, 
        :password, :image, 
        :camp_type, 
        :id :user_id
      )
    end

    def wizard_steps
      [
        :screen_2,
        :screen_3,
        :screen_4,
        :screen_5,
        :screen_6,
        :screen_7,
        :screen_8
      ]
    end

    def camp_validity
      return if params[:camp][:id].blank?
      @camp = Camp.find_by(id: params[:camp][:id])
      return (redirect_to camp_multi_step_path(:select_camp), alert: "Registration closed, Please Select other") if @camp.applicant_registration_end_date <= Date.today
    end
  end
end
