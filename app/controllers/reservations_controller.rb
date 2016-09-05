class ReservationsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_reservation, only: [:update, :destroy]
  before_action :authorize_user!, except: [:index, :create]

  def create
    @reservation = Reservation.new
    @reservation.user_id = current_user.id
    @reservation.astroturf_id = params[:astroturf_id]
    @reservation.date = params[:reservation][:date]
    if @reservation.save
      flash[:success] =  'Rezervasyonunuz başarılı bir şekilde olıuşturuldu..'
      redirect_to reservations_path
    else
      flash[:danger] =  'Rezervasyon yapılamadı'
      redirect_to reservations_path
    end

  end

  def update
    if @reservation.update(date: params[:reservation][:date])
      flash[:success] =  'Rezervasyonunuz başarılı bir şekilde güncellendi..'
      redirect_to reservations_path
    else
      flash[:danger] =  'Rezervasyonunuz güncellenemedi..'
      redirect_to reservations_path
    end
  end

  def index
    @reservations = Reservation.where(user_id: current_user.id)
  end

  def destroy
    @reservation.destroy
    flash[:danger] =  'Rezervasyonunuz başarıyla silindi..'
    redirect_to reservations_path
  end

  def authorize_user!
    redirect_to root_path, notice: "Yetkisiz giriş." unless current_user.id == @reservation.user_id
  end

  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end
end
