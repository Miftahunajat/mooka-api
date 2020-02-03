class AssociatiedAccountsController < ApplicationController
  before_action :set_associatied_account, only: [:show, :update, :destroy]

  # GET /associated_account
  # GET /associated_account.json
  def index
    @associatied_accounts = AssociatiedAccount.all
    render json: {items: @associatied_accounts}
  end

  # GET /associatied_accounts/1
  # GET /associatied_accounts/1.json
  def show
    render json: @associatied_account
  end

  # POST /associatied_accounts
  # POST /associatied_accounts.json
  def create
    umkm_id = params[:umkm_id]
    username = params[:username]
    password = params[:password]
    product_id = params[:product_id]
    type_name = params[:type_name]
    status = "REQUESTING"
    @product = Product.find(params[:product_id])
    @ac = AssociatiedAccount.find_or_create_by(umkm_id: umkm_id, product_id: product_id, type_name: type_name, status: "REQUESTING")
    if @ac
      if (type_name == 'SHOPEE')
        resp = Faraday.new(url: 'https://sinatra-selenium.herokuapp.com').post('/shopee', {
          username: username, password: password,title: @product.title,
          description: @product.description, price: @product.harga, qty: @product.stock, image_link: @product.gambar.url, berat: @product.berat, ac_id: @ac.id
          })
        elsif (type_name == 'FACEBOOK')
          resp = Faraday.new(url: 'https://sinatra-selenium.herokuapp.com').post('/facebook', {
          username: username, password: password,title: @product.title,
          description: @product.description, price: @product.harga, qty: @product.stock, image_link: @product.gambar.url, berat: @product.berat, ac_id: @ac.id
          })
        elsif (type_name == 'TOKPED')
          resp = Faraday.new(url: 'https://sinatra-selenium.herokuapp.com').post('/tokped', {
          username: username, password: password,title: @product.title,
          description: @product.description, price: @product.harga, qty: @product.stock, image_link: @product.gambar.url, berat: @product.berat, ac_id: @ac.id
          })
      end
      render json: @ac
    else
      render json: @ac.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /associatied_accountccounts/1
  # PATCH/PUT /associatied_accountts/1.json
  def update
    link = params[:link]
    status = params[:status]
    otp = params[:otp]

    if !otp.nil?
      res = @associatied_account.update(otp: otp)
    else
      res = @associatied_account.update(link: link, status: status, otp: otp)
    end

    if res
      render json: @associatied_account
    else
      render json: @associatied_account.errors, status: :unprocessable_entity
    end
  end

  # DELETE /associatied_accountccounts/1
  # DELETE /associatied_accountts/1.json
  def destroy
    @associatied_account.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_associatied_account
      @associatied_account = AssociatiedAccount.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def associatied_account_params
      params.permit(
        :username,
        :password,
        :type,
        :type_name,
        :status,
        :link,
        :otp,
        :umkm_id
      )
    end
end
