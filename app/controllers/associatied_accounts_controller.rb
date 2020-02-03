class AssociatiedAccountsController < ApplicationController
  before_action :set_associatied_account, only: [:show, :update, :destroy]

  # GET /associated_account
  # GET /associated_account.json
  def index
    @associatied_accounts = AssociatiedAccount.all
    render json: @associated_accounts
  end

  # GET /associatied_accounts/1
  # GET /associatied_accounts/1.json
  def show
    render json: @associatied_account, include: [{orders: {include: :product}}, :products]
  end

  # POST /associatied_accounts
  # POST /associatied_accounts.json
  def create
    @associatied_account = AssociatiedAccount.new(associatied_account_params)

    if @associatied_account.save
      render json: @associatied_account
    else
      render json: @associatied_account.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /associatied_accountccounts/1
  # PATCH/PUT /associatied_accountts/1.json
  def update
    if @associatied_account.update(associatied_accountm_params)
      render :show, status: :ok, location: @associatied_account
    else
      render json: @associatied_account.errors, status: :unprocessable_entity
    end
  end

  # DELETE /associatied_accountccounts/1
  # DELETE /associatied_accountts/1.json
  def destroy
    @associatied_accountt.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_umkm
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
