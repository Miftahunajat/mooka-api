class UmkmsController < ApplicationController
  before_action :set_umkm, only: [:show, :update, :destroy]

  # GET /umkms
  # GET /umkms.json
  def index
    @umkms = Umkm.all
    if (!request.query_parameters[:kota].nil?)
      @umkms = @umkms.select{|x| x.kota == request.query_parameters[:kota]}
      render json: { items: @umkms } , include: :jenis_umkm
    else
      render json: { items: @umkms } , include: :jenis_umkm
    end
  end

  # GET /umkms/1
  # GET /umkms/1.json
  def show
    render json: @umkm
  end

  # POST /umkms
  # POST /umkms.json
  def create
    @umkm = Umkm.new(umkm_params)

    if @umkm.save
      render :show, status: :created, location: @umkm
    else
      render json: @umkm.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /umkms/1
  # PATCH/PUT /umkms/1.json
  def update
    if @umkm.update(umkm_params)
      render :show, status: :ok, location: @umkm
    else
      render json: @umkm.errors, status: :unprocessable_entity
    end
  end

  # DELETE /umkms/1
  # DELETE /umkms/1.json
  def destroy
    @umkm.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_umkm
      @umkm = Umkm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def umkm_params
      params.permit(:nama, :email, :nama_pemilik, :gambar, :alamat, :jenis_umkm_id, :siup, :logo, :kota)
    end
end
