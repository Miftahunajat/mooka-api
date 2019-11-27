class InboxesController < ApplicationController
  before_action :set_inbox, only: [:show, :update, :destroy]

  # GET /inboxes
  # GET /inboxes.json
  def index
    @inboxes = Inbox.all
    @inboxes = @inboxes.select { |x| x.umkm_id == params[:umkm_id].to_i }
    render json: {items: @inboxes}
  end

  # GET /inboxes/1
  # GET /inboxes/1.json
  def show
    render json: @inbox
  end

  # POST /inboxes
  # POST /inboxes.json
  def create
    @inbox = Inbox.new(inbox_params)

    if @inbox.save
      render :show, status: :created, location: @inbox
    else
      render json: @inbox.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /inboxes/1
  # PATCH/PUT /inboxes/1.json
  def update
    if @inbox.update(inbox_params)
      render :show, status: :ok, location: @inbox
    else
      render json: @inbox.errors, status: :unprocessable_entity
    end
  end

  # DELETE /inboxes/1
  # DELETE /inboxes/1.json
  def destroy
    @inbox.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inbox
      @inbox = Inbox.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inbox_params
      params.require(:inbox).permit(:tipe, :judul, :text, :umkm_id)
    end
end
