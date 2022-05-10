class PhotosController < ApplicationController
  before_action :authenticate_user!

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
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])
    if @photo.update(photo_params)
      redirect_to photos_path
    else
      render :edit
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to photos_path
  end

  private

  def photo_params
    params.require(:photo).permit(:text, :image).merge(user_id: current_user.id)
  end
end
