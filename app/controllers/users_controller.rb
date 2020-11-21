class UsersController < ApplicationController
  
  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true)
  end
  
  def show
    @user = User.find(params[:id]) 
  end
  
  def new
    @user = User.new()
  end
  
  def create
    @user = User.new(user_params)
    
    if User.exists?(uid: [@user.uid])
      @user.mail = User.find_by(uid: @user.uid).mail
    end
    
    if @user.save
      flash[:notice] = "ユーザー追加"
      redirect_to root_path
    else
      render "new"
    end
  end
  
  def add_room
    @user = User.find(params[:id])
  end
  
  def regist_room
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to root_path
  end
  
  def strike
    @user = User.find(params[:id])
  end
  
  def regist_time
    @user = User.find(params[:id])
    if @user.time_in.nil?
      params[:user][:time_in] = Time.current
      @user.update(user_params)
      redirect_to root_path
    else
      params[:user][:time_out] = Time.current
      @user.update(user_params)
      redirect_to root_path
    end
  end
  
  private
  
  
  def user_params
    params.require(:user).permit(:uid, :mail, :room, :time_in, :time_out)
  end

end
