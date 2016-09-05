class VotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_astroturf
  before_action :set_vote, only: [:update]
  before_action :authorize_user!, only: [:update]
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

  def set_vote
    @vote = Vote.find(params[:id])
  end

  def authorize_user!
    redirect_to root_path, notice: "Sadece kendi oyunu değiştirebilirsin." unless current_user.id == @vote.user_id
  end
end
