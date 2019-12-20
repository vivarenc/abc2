class CalcsController < ApplicationController
  before_action :authenticate_user!

  def create
    @calc = Calc.new(calc_params)
    @calc.user = current_user
    @calc.save!
    redirect_to calcs_path
  end

  def edit
      @calc = Calc.find(params[:id])
  end

  def index
    @calcs_adult = Calc.where("user_id = #{current_user.id}").pluck("adults_quantity").first
    @calcs_kids = Calc.where("user_id = #{current_user.id}").pluck("kids_quantity").first
    @calcs_count = Calc.where("user_id = #{current_user.id}").count("adults_quantity")
    @guests_count = Guest.where("user_id = #{current_user.id}").count("role")
    @calcs = Calc.where("user_id = #{current_user.id}")
  end

  def update
    @calc = Calc.find(params[:id])
    @calc.user = current_user
    @calc.update_attributes(calc_params)
    @calc.save!
    redirect_to calcs_path
  end

  def new
    @calc = Calc.new
  end

   private
   def calc_params
      params.require(:calc).permit(:adults_quantity, :kids_quantity, :user_id)
    end

end
