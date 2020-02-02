class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
    if (!request.query_parameters[:kota].nil?)
      @products = @products.select{|x| x.umkm.kota == request.query_parameters[:kota]}
    end
    render json: {items: @products}, include: :umkm

  end

  # GET /products/1
  # GET /products/1.json
  def show
    render json: @product, include: [:umkm, :ulasans]
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new()
    @product.umkm_id = params[:umkm_id]
    @product.stock = params[:stock]
    @product.title = params[:title]
    @product.harga = params[:harga]
    @product.description = params[:description]
    @product.gambar = params[:file]

    if @product.save
      render :show, status: :created, location: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    if @product.update(product_params)
      render :show, status: :ok, location: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.permit(:umkm_id, :gambar, :stock, :title, :harga, :rating, :buy_count, :description)
    end
end
