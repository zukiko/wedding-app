class Users::RegistrationsController < Devise::RegistrationsController
  
  # newアクションは変更なし
  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    @user = User.new(sign_up_params)
    render :new and return if params[:back] || !@user.save
    redirect_to users_sign_up_complete_path
  end

  #確認画面
  def confirm
    # i = 0
    # @password = ""
    # while i < @user.password.length
    #   @password += "*"
    #   i += 1
    # end
    @user = User.new(sign_up_params)
    render :new if @user.invalid?
  end

  # 新規追加
  def complete
  end

end
