class ServicesController < ApplicationController
  before_action :authenticate_user!

  def new
    @service = Service.new
  end

  def edit
    @service = Service.find(params[:id])
  end

  def index
  end

  def show
    @service = Service.find(params[:id])
  end

  def create
    @service = Service.new(service_params)
    @service.user = current_user
    @service.save(:validate => false)
    redirect_to services_path
  end


  def destroy
    @service = Service.find(params[:id])
    @service.destroy
    redirect_to my_services_path
  end

  def update
    @service = Service.find(params[:id])
    @service.user = current_user
    @service.update_attributes(service_params)
    @service.save(:validate => false)
    redirect_to services_path
  end

  def bands
    #@services = Service.where(service_type: "Zespół weselny / DJ")
    #@services2 = Service.left_outer_joins(:ratings).where(service_type: "Zespół weselny / DJ")
    @services3 = Service.find_by_sql("select services.name, services.location, services.website, ifnull(ratings.rate, 'brak')
                  from services left outer join ratings on services.id = ratings.service_id")
    @services_count = Service.where(service_type: "Zespół weselny / DJ").count("name")

    @calcs_kids = Calc.where("user_id = #{current_user.id}").pluck("kids_quantity").first
  end

  def medias
    @services = Service.where(service_type: "Fotograf / Kamerzysta")
    @services_count = Service.where(service_type: "Fotograf / Kamerzysta").count("name")
  end

  def wedding_halls
    @services = Service.where(service_type: "Sala weselna")
    @services_count = Service.where(service_type: "Sala weselna").count("name")

  end

  def my_services
    @services = Service.where("user_id = #{current_user.id}")
  end

   private
   def service_params
      params.require(:service).permit(:service_type, :name, :location, :website, :contact, :description, :user_id)
   end
end
