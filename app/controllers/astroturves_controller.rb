class AstroturvesController < ApplicationController

  def index
    @astroturves = Astroturf.all
  end

  def new
    @astroturf = Astroturf.new
  end

  def create
    @astroturf = Astroturf.new(strong_params)

    if @astroturf.save
      flash[:success] =  'Halısaha başarılı bir şekilde eklendi..'
      redirect_to astroturf_path(@astroturf)
    else
      render :new
    end
  end

  def show
      @astroturf = Astroturf.find(params[:id])
  end


  private

  def strong_params
    params.require(:astroturf).permit(:name, :address, :city, :info, :phone, :map, :facebook, :twitter, :instagram)
	end
end
