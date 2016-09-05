class ServicesController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_service, only: [:show, :destroy]
  before_action :authorize_user!, except: [:index, :show]

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
      flash[:danger] =  'Servis Oluşturulamadı'
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
  def authorize_user!
    redirect_to root_path, notice: "Bu sayfayı sadece yöneticiler görebilir." unless current_user.admin
  end
end
