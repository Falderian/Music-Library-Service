class FavoritesController < ApplicationController
  before_action :set_favorite, only: %i[ index update destroy ]
  
  # GET /favs/:id
  def index
    if !@favorite.nil?
      render json: @favorite
    else 
      render json: 'There is no favorites for this user', status: :not_found
    end 
  end

  # POST /favs/artist
  def update
    if !@favorite.nil? && !@favorite[params[:type]].nil? 
      @favorite[params[:type]] << params[:id_to_update] unless @favorite[params[:type]].include?(params[:id_to_update])
      @favorite.save
      render json: @favorite, status: :ok
    else
      render json: 'Bad request', status: :bad_request
    end
  end

  # DELETE /favorites/1
  def destroy
    if !@favorite.nil? && !@favorite[params[:type]].nil?
      @favorite[params[:type]].delete(params[:id_to_update]) if @favorite[params[:type]].include?(params[:id_to_update])
      @favorite.save
      render json: @favorite, status: :ok
    else
      render json: 'Bad request', status: :bad_request
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favorite      
      @favorite = Favorite.find_by user_id: params[:user_id]
    end
end
