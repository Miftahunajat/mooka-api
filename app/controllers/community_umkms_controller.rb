class CommunityUmkmsController < ApplicationController
  before_action :set_community_umkm, only: [:show, :update, :destroy]

  # GET /community_umkms
  # GET /community_umkms.json
  def index
    @community_umkms = CommunityUmkm.all
    @community_umkms = @community_umkms.select{|x| x.umkm_id == params[:umkm_id].to_i}
    render json: {items: @community_umkms }, include: :community
  end

  # GET /community_umkms/1
  # GET /community_umkms/1.json
  def show
  end

  # POST /community_umkms
  # POST /community_umkms.json
  def create
    @community_umkm = CommunityUmkm.new(community_umkm_params)

    if @community_umkm.save
      render json: @community_umkm
    else
      render json: @community_umkm.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /community_umkms/1
  # PATCH/PUT /community_umkms/1.json
  def update
    if @community_umkm.update(community_umkm_params)
      render :show, status: :ok, location: @community_umkm
    else
      render json: @community_umkm.errors, status: :unprocessable_entity
    end
  end

  # DELETE /community_umkms/1
  # DELETE /community_umkms/1.json
  def destroy
    @community_umkm.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_community_umkm
      @community_umkm = CommunityUmkm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def community_umkm_params
      params.permit(:community_id, :umkm_id, :is_admin)
    end
end
