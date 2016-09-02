class VotesController < ApplicationController
  before_action :set_astroturf
  def create

    @vote = @astroturf.votes.new
    redirect_to @astroturf, notice: "Lütfen boş bırakmayın" and return if params[:vote].nil?
    @vote.rating = params[:vote][:rating]
    @vote.user = current_user

    if @vote.save
      flash[:success] =  'Değerlendirmeniz kaydedildi'
      redirect_to @astroturf
    else
      flash[:danger] =  'Hata oluştu, Değerlendirmeniz kaydedilemedi'
      redirect_to @astroturf
    end
  end

  def update
    @vote = Vote.find(params[:id])
    if @vote.update(rating: params[:vote][:rating])
      flash[:success] =  'Değerlendirmeniz güncellendi.'
      redirect_to @astroturf
    else
      flash[:danger] =  'Hata oluştu, değerlendirmeniz güncellenemedi.'
      redirect_to @astroturf
    end
  end


  private
  def set_astroturf
    @astroturf = Astroturf.find(params[:astroturf_id])
  end
end
