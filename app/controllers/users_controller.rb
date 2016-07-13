class UsersController < ApplicationController
  before_action :authorise_user, :only => [:index]
  before_action :check_for_user, :only => [:edit, :update]

  def index
    @users = User.all
  end

  def edit
    @user = @current_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create user_params
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new
    end
  end

  def search
    locals = Location.where(name: params[:name])
    @users = User.where(:location => locals)
    @loc = Location.where(name: params[:name]).take
  end

  def show
    @user = User.find params[:id]
  end

  def update
    @user = @current_user
    location = Location.find_or_create_by(:name => params[:user][:location])
    # raise "hell"
    if @user.update user_params
      location.users << @user
      redirect_to @user
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :image, :password, :password_confirmation )
  end

  def authorise_user
    redirect_to root_path unless @current_user.present? && @current_user.admin?
  end

  def check_for_user
    redirect_to new_user_path unless @current_user.present?
  end

end
