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

    @user = User.new user_params
    # # raise "help"
    # @user.image = req["url"]
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new
    end
  end

  def search
    if params[:name].present?
      @pic_references = []
      locals = Location.where(name: params[:name])
      @users = User.where(:location => locals)
      @loc = Location.where(name: params[:name]).take
      @google_api_loc_url =   "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{@loc.latitude},#{@loc.longitude}&key=AIzaSyCv0-SAulKA7HptNKQDsMNlT0jYrYx2eoE"
      loc_reference = HTTParty.get(@google_api_loc_url, :verify => false)
      loc_reference["results"].each_index do |i|
        @pic_references.push(loc_reference["results"][i]["photos"].first["photo_reference"]) if   loc_reference["results"][i].include?("photos")
      end
    else
      redirect_to @current_user
    end
  end
  # raise "hell"
  # pic_reference =  loc_reference["results"].second["photos"].first["photo_reference"]

  # @image = "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=#{pic_reference}&key=AIzaSyCv0-SAulKA7HptNKQDsMNlT0jYrYx2eoE"

  def show
    @user = User.find params[:id]
  end

  def update

    # This is the magic stuff that will let us upload an image to Cloudinary when creating a new animal.
    @user = @current_user
    if params[:file].present?
      req = Cloudinary::Uploader.upload(params[:file])
      @user.image = req["url"]
      location = Location.find_or_create_by(:name => params[:user][:location])
      # raise "hell"
      if @user.update user_params
        location.users << @user
        redirect_to @user
      else
        render :edit
      end
    else
      location = Location.find_or_create_by(:name => params[:user][:location])
      # raise "hell"
      if @user.update user_params
        location.users << @user
        redirect_to @user
      else
        render :edit
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation )
  end

  def authorise_user
    redirect_to root_path unless @current_user.present? && @current_user.admin?
  end

  def check_for_user
    redirect_to new_user_path unless @current_user.present?
  end

end
