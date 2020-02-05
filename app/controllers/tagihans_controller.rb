class TagihansController < ApplicationController
  before_action :set_tagihan, only: [:show, :edit, :update, :destroy]

  # GET /tagihans
  # GET /tagihans.json
  def index
    @tagihans = Tagihan.all
    @tagihans = @tagihans.select { |x| x.user_id == params[:user_id].to_i }
    render json: { items: @tagihans }
  end

  # GET /tagihans/1
  # GET /tagihans/1.json
  def show
  end

  # GET /tagihans/new
  def new
    @tagihan = Tagihan.new
  end

  # GET /tagihans/1/edit
  def edit
  end

  # POST /tagihans
  # POST /tagihans.json
  def create
    @tagihan = Tagihan.new(tagihan_params)

    respond_to do |format|
      if @tagihan.save
        format.html { redirect_to @tagihan, notice: 'Tagihan was successfully created.' }
        format.json { render :show, status: :created, location: @tagihan }
      else
        format.html { render :new }
        format.json { render json: @tagihan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tagihans/1
  # PATCH/PUT /tagihans/1.json
  def update
    if @tagihan.update(tagihan_params)
        render json: @tagihan
      else
        render json: @tagihan.errors, status: :unprocessable_entity
      end
  end

  # DELETE /tagihans/1
  # DELETE /tagihans/1.json
  def destroy
    @tagihan.destroy
    respond_to do |format|
      format.html { redirect_to tagihans_url, notice: 'Tagihan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tagihan
      @tagihan = Tagihan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tagihan_params
      params.require(:tagihan).permit(:jumlah, :user_id, :status)
    end
end
