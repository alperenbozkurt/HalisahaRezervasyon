class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :astroturf_find
  before_action :comment_find, only: [:destroy]
  before_action :comment_owner!, only: [:destroy]

  def create
    @comment = @astroturf.comments.create(params[:comment].permit(:content))
    @comment.user_id = current_user.id

    if @comment.save
      flash[:success] = 'Yorum başarıyla eklendi.'
      redirect_to astroturf_path(@astroturf)
    else
      render 'new'
    end
  end

  def destroy
    @comment.destroy
    flash[:success] = 'Yorumunuz başarılı bir şekilde silindi..'
    redirect_to astroturf_path(@astroturf)
  end

  private

  def astroturf_find
    @astroturf = Astroturf.find(params[:astroturf_id])
  end

  def comment_find
    @comment = @astroturf.comments.find(params[:id])
  end

  def comment_owner!
    unless current_user.id == @comment.user_id
      flash[:danger] = 'Bu Yorumu silme yetkin yok..'
      redirect_to @astroturf
    end
  end
end
