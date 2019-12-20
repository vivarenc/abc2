class RatingsController < ApplicationController
  def new
    @rating = Rating.new
    #  @id = params[:service_id]
    #@rating.service_id = params[:service_id]
    #@rating.service_id = @id
    #@id = Service.find_by_id
    #@id = Service.where(["service_name = :s", { s: service_name}]).pluck("id")
  end

  def show
  end

  def edit
    @rating = Rating.find(params[:id])
  end

  def index
    @rating = Rating.where("user_id = #{current_user.id}")
  end

  def destroy
    @rating = Rating.find(params[:id])
    @rating.destroy
    redirect_to services_path
  end

  def create
    #@rating = Rating.
    @rating = Rating.new(rating_params)
    #@rating.service_id = @id
    #@rating.service = params[:service_id]
    #@service = Service.find(params[:id])
    #@rating = Service.ratings.build(rating_params)
    #service = Service.find(params[:service])
    #@service = Service.find(params[:id])
    #@service = Service.find_by_id(params[:id])
    #@rating = params[:service_id]
    #@rating.service = @paramss.query
    @rating.service_id = params[:service_id]
    @rating.user = current_user
    @rating.save(:validate => false)
    redirect_to services_path
  end

  def update
    @rating = Rating.find(params[:id])
    @rating.user = current_user
    @rating.update_attributes(rating_params)
    @rating.save(:validate => false)
    redirect_to services_path
  end

  private
  def rating_params
     params.require(:rating).permit(:rate, :comment, :signature, :service_id, :user_id)
   end
end
