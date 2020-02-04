class BriController < ApplicationController
  def cek_pembayaran
    bri = Bri.new
    custcode = params[:custcode]
    response = bri.get_briva_status(custcode)
    render json: response
  end

  def buat_pembayaran
    bri = Bri.new
    custcode = params[:custcode]
    nama = params[:nama]
    amount = params[:amount]
    keterangan = params[:keterangan]
    response = bri.create_briva_endpoint(nama, amount, custcode, keterangan)
    render json: response
  end

end
