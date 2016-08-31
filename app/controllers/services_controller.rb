class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :destroy]

  def index
    @services = Service.all
  end

  def show

  end

  def new
    @service = Service.new
  end

  def create
    @service = Service.new(strong_params)

    if @service.save
      flash[:success] =  'Servis başarılı bir şekilde oluşturuldu..'
      redirect_to services_path
    else
      flash[:error] =  'Servis Oluşturulamadı'
      render :new
    end
  end

  def destroy
    @service.destroy
    flash[:success] = 'Servis bir şekilde silindi..'
    redirect_to services_path
  end

  private

  def strong_params
    params.require(:service).permit(:name)
  end
  def set_service
    @service = Service.find(params[:id])
  end
end
