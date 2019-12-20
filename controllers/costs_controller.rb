class CostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @costs = Cost.where("user_id = #{current_user.id}")
    #@costs_sum = Cost.sum("amount") #.where("user_id = #{current_user.id}")
    @costs_sum = Cost.where("user_id = #{current_user.id}").sum("amount")
  #  @sql = select sum(amount) from costs
  #  @costs_sum = ActiveRecord::Base.connection.execute(sql)
  #  @costs = Cost.all
  end

  def create
    @cost = Cost.new(cost_params)
    @cost.user = current_user
    @cost.save!
    redirect_to costs_path
  end

  def update
    @cost = Cost.find(params[:id])
    @cost.user = current_user
    @cost.update_attributes(cost_params)
    @cost.save!
    redirect_to costs_path
  end

  def destroy
    @cost = Cost.find(params[:id])
    @cost.destroy
    redirect_to costs_path
  end

  def show
    @cost = Cost.find(params[:id])
  end

  def edit
    @cost = Cost.find(params[:id])
  end

  def new
    @cost = Cost.new
  end

  def comparsion
    @costs_sum_hall = Cost.where(user_id: "#{current_user.id}").where(cost_type: "Sala weselna").sum("amount")
    @costs_sum_church = Cost.where(user_id: "#{current_user.id}").where(cost_type: "Kościoł").sum("amount")
    @costs_sum_decor = Cost.where(user_id: "#{current_user.id}").where(cost_type: "Dekoracje").sum("amount")
    @costs_sum_band = Cost.where(user_id: "#{current_user.id}").where(cost_type: "Zespół").sum("amount")
    @costs_sum_photo = Cost.where(user_id: "#{current_user.id}").where(cost_type: "Fotograf").sum("amount")
    @costs_sum_camera = Cost.where(user_id: "#{current_user.id}").where(cost_type: "Kamerzysta").sum("amount")
    @costs_sum_jewellery = Cost.where(user_id: "#{current_user.id}").where(cost_type: "Biżuteria").sum("amount")
    @costs_sum_others = Cost.where(user_id: "#{current_user.id}").where(cost_type: "Inne").sum("amount")
    @costs_sum = Cost.where("user_id = #{current_user.id}").sum("amount")

    @costs_avg_hall_all = Cost.where(cost_type: "Sala weselna").average("amount")
    @costs_avg_church_all = Cost.where(cost_type: "Kościoł").average("amount")
    @costs_avg_decor_all = Cost.where(cost_type: "Dekoracje").average("amount")
    @costs_avg_band_all = Cost.where(cost_type: "Zespół").average("amount")
    @costs_avg_photo_all = Cost.where(cost_type: "Fotograf").average("amount")
    @costs_avg_camera_all = Cost.where(cost_type: "Kamerzysta").average("amount")
    @costs_avg_jewellery_all = Cost.where(cost_type: "Biżuteria").average("amount")
    @costs_avg_others_all = Cost.where(cost_type: "Inne").average("amount")
  end

 private
 def cost_params
    params.require(:cost).permit(:cost_type, :amount, :notes, :user_id)
  end
end
