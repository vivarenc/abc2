class GuestsController < ApplicationController
  before_action :authenticate_user!

  def index
#   @guests = Guest.all
    @guests = Guest.where("user_id = #{current_user.id}")
    @guests_count = Guest.where("user_id = #{current_user.id}").count("role")
    respond_to do |format|
      format.html {}
      format.json { render json: @guests.map { |g| { name: g.name, id: g.id } } }
    end
  end

  def create
    @guest = Guest.new(guest_params)
    @guest.user = current_user
    @guest.save(:validate => false)
    redirect_to guests_path
  end

  def update
    @guest = Guest.find(params[:id])
    @guest.user = current_user
    @guest.update_attributes(guest_params)
    @guest.save(:validate => false)
    redirect_to guests_path
  end

  def destroy
    @guest = Guest.find(params[:id])
    @guest.destroy
    redirect_to guests_path
  end

  def show
    @guest = Guest.find(params[:id])
  end

  def edit
    @guest = Guest.find(params[:id])
  end

  def new
    @guest = Guest.new
  end

  def deploy
    @guests = Guest.where("user_id = #{current_user.id}")
    @guests_count = Guest.where(user_id: "#{current_user.id}").count("role")
    @guests_fam_friends = Guest.where(user_id: "#{current_user.id}").where(role: "Znajomi/Delegacje")
    @guests_bride_mother = Guest.where(user_id: "#{current_user.id}").where(role: "Rodzina Panny Młodej od strony matki")
    @guests_bride_father = Guest.where(user_id: "#{current_user.id}").where(role: "Rodzina Panny Młodej od strony ojca")
    @guests_groom_mother = Guest.where(user_id: "#{current_user.id}").where(role: "Rodzina Pana Młodego od strony matki")
    @guests_groom_father = Guest.where(user_id: "#{current_user.id}").where(role: "Rodzina Pana Młodego od strony ojca")
  end

 private
 def guest_params
    params.require(:guest).permit(:name, :age_group, :family, :role, :user_id)
  end
end
