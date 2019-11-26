class UsersFavoritesController < ApplicationController
  before_action :set_users_favorite, only: [:show, :update, :destroy]

  # GET /users_favorites
  # GET /users_favorites.json
  def index
    @users_favorites = UsersFavorite.all
  end

  # GET /users_favorites/1
  # GET /users_favorites/1.json
  def show
  end

  # POST /users_favorites
  # POST /users_favorites.json
  def create
    @users_favorite = UsersFavorite.new(users_favorite_params)

    if @users_favorite.save
      render :show, status: :created, location: @users_favorite
    else
      render json: @users_favorite.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users_favorites/1
  # PATCH/PUT /users_favorites/1.json
  def update
    if @users_favorite.update(users_favorite_params)
      render :show, status: :ok, location: @users_favorite
    else
      render json: @users_favorite.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users_favorites/1
  # DELETE /users_favorites/1.json
  def destroy
    @users_favorite.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_users_favorite
      @users_favorite = UsersFavorite.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def users_favorite_params
      params.require(:users_favorite).permit(:user_id, :product_id)
    end
end
