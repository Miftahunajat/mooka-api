class PengirimenController < ApplicationController
  before_action :set_pengiriman, only: [:show, :update, :destroy]

  # GET /pengirimen
  # GET /pengirimen.json
  def index
    @pengirimen = Pengiriman.all
    render json: @pengirimen
  end

  # GET /pengirimen/1
  # GET /pengirimen/1.json
  def show
    render json: @pengiriman
  end

  # POST /pengirimen
  # POST /pengirimen.json
  def create
    @pengiriman = Pengiriman.new(pengiriman_params)

    if @pengiriman.save
      render :show, status: :created, location: @pengiriman
    else
      render json: @pengiriman.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pengirimen/1
  # PATCH/PUT /pengirimen/1.json
  def update
    if @pengiriman.update(pengiriman_params)
      render :show, status: :ok, location: @pengiriman
    else
      render json: @pengiriman.errors, status: :unprocessable_entity
    end
  end

  # DELETE /pengirimen/1
  # DELETE /pengirimen/1.json
  def destroy
    @pengiriman.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pengiriman
      @pengiriman = Pengiriman.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pengiriman_params
      params.permit(:nama, :harga)
    end
end
