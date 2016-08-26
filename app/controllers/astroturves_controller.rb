class AstroturvesController < ApplicationController
  before_action :set_astroturf, only: [:show, :edit, :update, :destroy]
  def index
    @astroturves = Astroturf.all
  end

  def new
    @astroturf = Astroturf.new
  end

  def create
    @astroturf = Astroturf.new(strong_params)

    if @astroturf.save
      flash[:success] =  'Halısaha başarılı bir şekilde oluşturuldu..'
      redirect_to astroturf_path(@astroturf)
    else
      flash[:error] =  'Halısaha Oluşturulamadı'
      render :new
    end
  end

  def show

  end

  def edit
    
  end

  def update
    if @astroturf.update(strong_params)
      flash[:success] = 'Halısaha başarılı bir şekilde güncellendi..'
      redirect_to astroturf_path(@astroturf)
    else
      flash[:error] = 'Halısaha Güncellenemedi.'
      render :edit
    end
  end

  def destroy
      @astroturf.destroy
      flash[:success] = 'Halısaha başarılı bir şekilde silindi..'
      redirect_to astroturves_path
  end
  private
  def set_astroturf
    @astroturf = Astroturf.find(params[:id])
  end
  def strong_params
    params.require(:astroturf).permit(:name, :address, :city, :info, :phone, :map, :facebook, :twitter, :instagram)
	end
end
