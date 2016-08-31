class VotesController < ApplicationController
  before_action :set_astroturf
  def create

    @vote = @astroturf.votes.new
    redirect_to @astroturf, notice: "Lütfen boş bırakmayın" and return if params[:vote].nil?
    @vote.rating = params[:vote][:rating]
    @vote.user = current_user

    if @vote.save
      redirect_to @astroturf, notice: "Değerlendirmeniz kaydedildi"
    else
      redirect_to @astroturf, notice: "Hata oluştu, Değerlendirmeniz kaydedilemedi"
    end
  end

  def update
    @vote = Vote.find(params[:id])
    if @vote.update(rating: params[:vote][:rating])
      redirect_to @astroturf, notice: "Değerlendirmeniz güncellendi."
    else
      redirect_to @astroturf, notice: "Hata oluştu, değerlendirmeniz güncellenemedi."
    end
  end


  private
  def set_astroturf
    @astroturf = Astroturf.find(params[:astroturf_id])
  end
end
