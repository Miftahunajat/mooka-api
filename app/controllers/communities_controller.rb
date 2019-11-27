class CommunitiesController < ApplicationController
  before_action :set_community, only: [:show, :update, :destroy]

  # GET /communities
  # GET /communities.json
  def index
    @communities = Community.all
    render json: @communities
  end

  # GET /communities/1
  # GET /communities/1.json
  def show
    render json: @community
  end

  # POST /communities
  # POST /communities.json
  def create
    @community = Community.new(community_params)

    if @community.save
      render :show, status: :created, location: @community
    else
      render json: @community.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /communities/1
  # PATCH/PUT /communities/1.json
  def update
    if @community.update(community_params)
      render :show, status: :ok, location: @community
    else
      render json: @community.errors, status: :unprocessable_entity
    end
  end

  # DELETE /communities/1
  # DELETE /communities/1.json
  def destroy
    @community.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_community
      @community = Community.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def community_params
      params.require(:community).permit(:member_count, :title, :subtitle, :banner, :official)
    end
end
