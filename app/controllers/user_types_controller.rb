class UserTypesController < ApplicationController
  before_action :set_user_type, only: [:show, :update, :destroy]

  # GET /user_types
  # GET /user_types.json
  def index
    @user_types = UserType.all
    render json: @user_types
  end

  # GET /user_types/1
  # GET /user_types/1.json
  def show
    render json: @user_type
  end

  # POST /user_types
  # POST /user_types.json
  def create
    @user_type = UserType.new(user_type_params)

    if @user_type.save
      render json: @user_type
    else
      render json: @user_type.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /user_types/1
  # PATCH/PUT /user_types/1.json
  def update
    if @user_type.update(user_type_params)
      render :show, status: :ok, location: @user_type
    else
      render json: @user_type.errors, status: :unprocessable_entity
    end
  end

  # DELETE /user_types/1
  # DELETE /user_types/1.json
  def destroy
    @user_type.destroy
    render json: @user_type
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_type
      @user_type = UserType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_type_params
      params.permit(:jenis_user)
    end
end
