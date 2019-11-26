class CommunityPoinsController < ApplicationController
  before_action :set__community_poin, only: [:show, :edit, :update, :destroy]

  # GET /_community_poins
  # GET /_community_poins.json
  def index
    @_community_poins = CommunityPoin.all
  end

  # GET /_community_poins/1
  # GET /_community_poins/1.json
  def show
  end

  # GET /_community_poins/new
  def new
    @_community_poin = CommunityPoin.new
  end

  # GET /_community_poins/1/edit
  def edit
  end

  # POST /_community_poins
  # POST /_community_poins.json
  def create
    @_community_poin = CommunityPoin.new(_community_poin_params)

    respond_to do |format|
      if @_community_poin.save
        format.html { redirect_to @_community_poin, notice: 'Community poin was successfully created.' }
        format.json { render :show, status: :created, location: @_community_poin }
      else
        format.html { render :new }
        format.json { render json: @_community_poin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /_community_poins/1
  # PATCH/PUT /_community_poins/1.json
  def update
    respond_to do |format|
      if @_community_poin.update(_community_poin_params)
        format.html { redirect_to @_community_poin, notice: 'Community poin was successfully updated.' }
        format.json { render :show, status: :ok, location: @_community_poin }
      else
        format.html { render :edit }
        format.json { render json: @_community_poin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /_community_poins/1
  # DELETE /_community_poins/1.json
  def destroy
    @_community_poin.destroy
    respond_to do |format|
      format.html { redirect_to _community_poins_url, notice: 'Community poin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set__community_poin
      @_community_poin = CommunityPoin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def _community_poin_params
      params.require(:_community_poin).permit(:community_id, :umkm_id, :point)
    end
end
