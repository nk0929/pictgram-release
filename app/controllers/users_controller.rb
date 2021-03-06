class UsersController < ApplicationController
  
  def index
    @users = User.all.order(created_at: :desc)
  end
  
  def show
    @user = User.find_by(id: params[:id])
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to("/users/#{@user.id}"), success: '登録が完了しました'
    else
      flash.now[:danger] = "登録に失敗しました"
      render :new
    end
  end
  def edit
    @user = User.find_by(id: params[:id])
  end
  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]
    
    # if params[:image]
    #   @user.image_name = "#{@user.id}.jpg"
    #   image = params[:image]
    #   File.binwrite("public/user_images/#{@user.image_name}", image.read)
    # end
    
    if @user.save
      redirect_to("/users/#{@user.id}"), success: 'ユーザー情報を編集しました'
    else
      render("users/edit")
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
