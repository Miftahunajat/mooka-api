class JenisUmkmsController < ApplicationController
  before_action :set_jenis_umkm, only: [:show, :update, :destroy]

  # GET /jenis_umkms
  # GET /jenis_umkms.json
  def index
    @jenis_umkms = JenisUmkm.all
    render json: @jenis_umkms
  end

  # GET /jenis_umkms/1
  # GET /jenis_umkms/1.json
  def show
    render json: @jenis_umkm
  end

  # POST /jenis_umkms
  # POST /jenis_umkms.json
  def create
    @jenis_umkm = JenisUmkm.new(jenis_umkm_params)

    if @jenis_umkm.save
      render :show, status: :created, location: @jenis_umkm
    else
      render json: @jenis_umkm.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /jenis_umkms/1
  # PATCH/PUT /jenis_umkms/1.json
  def update
    if @jenis_umkm.update(jenis_umkm_params)
      render :show, status: :ok, location: @jenis_umkm
    else
      render json: @jenis_umkm.errors, status: :unprocessable_entity
    end
  end

  # DELETE /jenis_umkms/1
  # DELETE /jenis_umkms/1.json
  def destroy
    @jenis_umkm.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jenis_umkm
      @jenis_umkm = JenisUmkm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def jenis_umkm_params
      params.permit(:tipe_umkm)
    end
end
