class UsersController < ApplicationController
  before_action :set_user, only: %i[ show destroy ]
  after_action :create_favorites_lib, only: %i[ create ]
  # GET /users
  def index
    @users = User.all
    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save         
      render json: @user, status: :created, location: @user      
    else
      debugger 
      render json: @user.errors || @favorite.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def update_password
    @user = User.find(params[:user_id])
    if @user.password === params[:password] && params[:password_new] === params[:password_new_confirmation]
        @user.update(password: params[:password_new])
        render json: "Password updated succesfully", status: :ok
      else
        errorMessage = @user.password === params[:password] ? "New passwords do not match" : "Invalid old password"
        render json: errorMessage, status: :bad_request
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:login, :password, :version)
    end

    def user_params_update_password
      @user = User.find(params[:user_id])
      params.require(:user).permit(:password, :password_new, :password_new_confirmation)
    end

    def create_favorites_lib 
      @favorite = Favorite.new(
        user_id: @user.id,
        artists: [],
        albums: [],
        tracks: []        
      )
      @favorite.save
    end
end
