class Users::RegistrationsController < Devise::RegistrationsController

  def create
    @user = User.new(sign_up_params)
    render :new and return if params[:back] || !@user.save
    redirect_to users_sign_up_complete_path
  end

  #確認画面
  def confirm
    @user = User.new(sign_up_params)
    render :new if @user.invalid?
  end

  # 入力完了画面
  def complete
  end

end
