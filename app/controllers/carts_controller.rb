class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :update, :destroy]

  # GET /carts
  # GET /carts.json
  def index
    @carts = Cart.all
    @carts = @carts.select { |x| x.user_id == params[:user_id].to_i }
    render json: { items: @carts }, include: [
      :product,
      :umkm
    ]
  end

  # GET /carts/1
  # GET /carts/1.json
  def show
    render json: @cart
  end

  # POST /carts
  # POST /carts.json
  def create
    # @cart = Cart.new(cart_params)
    @cart = Cart.where(
      user_id: cart_params[:user_id],
      umkm_id: cart_params[:umkm_id],
      product_id: cart_params[:product_id]
    ).first_or_create.increment!(:count)
    render json: @cart
    # if @cart.save
      # render json: @cart
    # else
      # render json: @cart.errors, status: :unprocessable_entity
    # end
  end

  # PATCH/PUT /carts/1
  # PATCH/PUT /carts/1.json
  def update
    if @cart.update(cart_params)
      render json: @cart
    else
      render json: @cart.errors, status: :unprocessable_entity
    end
  end

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    @cart.destroy
  end

  def remove_all
    @carts = Cart.all
    @carts = @carts.select { |x| x.user_id == params[:user_id].to_i }
    @carts.each do |cart|
      cart.destroy
    end
    render json: @carts
  end

  def checkout
    harga = Cart.joins(:product).where(user_id: params[:user_id]).sum(:harga)
    user = User.find(params[:user_id])
    donasi = 0
    pengiriman = 0
    if (!params[:donasi].nil?)
      donasi = params[:donasi].to_i
    end
    if (!params[:pengiriman_id].nil?)
      pengirim = Pengiriman.find(params[:pengiriman_id])
      pengiriman = pengirim.harga.to_i
    end

    if (user.saldo < donasi + harga + pengiriman)
      render json: {status: 'Maaf uang anda tidak cukup'}, status: :forbidden
    else
      @carts = Cart.select { |x| x.user_id == params[:user_id].to_i }
      tagihan = Tagihan.new(jumlah: harga + donasi + pengiriman, user: user, status: 'N')
      @carts.each do |cart|
        for i in 1..cart.count do
          Order.create!(
            umkm_id: cart.umkm_id,
            user_id: cart.user_id,
            product_id: cart.product_id,
            status: "Menunggu Konfirmasi"
          )
        end
        cart.destroy
      end
      tagihan.save
      user.increment!(:total_donasi, donasi)
      user.decrement!(:saldo, donasi + harga + pengiriman)
      render json: tagihan
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_params
      params.permit(:user_id, :umkm_id, :product_id, :count)
    end
end
