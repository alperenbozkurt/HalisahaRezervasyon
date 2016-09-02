class ReservationsController < ApplicationController

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
    @reservation = Reservation.find(params[:id])
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
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    flash[:danger] =  'Rezervasyonunuz başarıyla silindi..'
    redirect_to reservations_path
  end
end
