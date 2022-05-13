class PhotosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_photo, only: [:edit, :update, :destroy]

  def index
    @photos = Photo.includes(:user)

    # ゲストがログインしている場合はcurrent_user.idを取得
    gon.current_user_id = current_user.id if user_signed_in?
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      redirect_to photos_path
    else
      render :new
    end
  end

  def edit
    # ゲストがログイン状態且つログインユーザーと写真投稿者が一致しない場合は編集ページは遷移せずphotos_pathへ
    unless user_signed_in? && current_user.id == @photo.user_id
      redirect_to photos_path
    end
  end

  def update
    if @photo.update(photo_params)
      redirect_to photos_path
    else
      render :edit
    end
  end

  def destroy
    @photo.destroy
    redirect_to photos_path
  end

  private

  def photo_params
    params.require(:photo).permit(:text, :image).merge(user_id: current_user.id)
  end

  def set_photo
    @photo = Photo.find(params[:id])
  end
end
