class UlasansController < ApplicationController
  before_action :set_ulasan, only: [:show, :update, :destroy]

  # GET /ulasans
  # GET /ulasans.json
  def index
    @ulasans = Ulasan.all
  end

  # GET /ulasans/1
  # GET /ulasans/1.json
  def show
  end

  # POST /ulasans
  # POST /ulasans.json
  def create
    @ulasan = Ulasan.new(ulasan_params)

    if @ulasan.save
      render :show, status: :created, location: @ulasan
    else
      render json: @ulasan.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /ulasans/1
  # PATCH/PUT /ulasans/1.json
  def update
    if @ulasan.update(ulasan_params)
      render :show, status: :ok, location: @ulasan
    else
      render json: @ulasan.errors, status: :unprocessable_entity
    end
  end

  # DELETE /ulasans/1
  # DELETE /ulasans/1.json
  def destroy
    @ulasan.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ulasan
      @ulasan = Ulasan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ulasan_params
      params.require(:ulasan).permit(:rating_count, :user_id, :product_id, :comment)
    end
end
