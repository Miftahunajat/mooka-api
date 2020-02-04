class Bri
  attr_accessor :signature, :timestamp, :fullpath, :token, :timestamp

  def initialize
    @url = 'https://sandbox.partner.api.bri.co.id'
    @get_url = 'https://partner.api.bri.co.id'
  end

  def create_briva_endpoint(nama,  amount, custCode = '3456789200', keterangan = "")
    data = {
    	"institutionCode": "J104408",
	    "brivaNo": "77777",
	    "custCode": custCode,
	    "nama": nama,
	    "amount": amount,
	    "keterangan": keterangan,
	    "expiredDate": 1.days.from_now.strftime("%F %H:%M:%S")
    }
    response = post_request('/sandbox/v1/briva',data)
    JSON.parse response.body
  end

  def get_briva_status(custCode = '3456789200')
    response = get_request('/v1/briva/J104408/77777/' + custCode,@url)
    JSON.parse response.body
  end

  def get_account_info(account_number)
    response = get_request('/sandbox/v2/inquiry/888801000157508')
    JSON.parse(response)['Data']
  end

  private

  def get_request(url, base_url = @get_url)
    @signature = get_signature(url, 'GET', '')
    @fullpath = base_url + url
    respon = connection.get(base_url + url) do |r|
      r.headers['Authorization'] = 'Bearer ' + @token
      r.headers['BRI-Signature'] = @signature
      r.headers['BRI-TIMESTAMP'] = @timestamp
    end
    respon
  end

  def post_request(url, params)
    @signature = get_signature(url, 'POST', params.to_json)
    @fullpath = @get_url + url
    respon = connection.post(@get_url + url) do |r|
      r.headers['Authorization'] = 'Bearer ' + @token
      r.headers['BRI-Signature'] = @signature
      r.headers['BRI-TIMESTAMP'] = @timestamp
      r.headers['Content-Type'] = 'application/json'
      r.body = params.to_json
    end
    respon
  end

  def get_access_token
    url = '/oauth/client_credential/accesstoken?grant_type=client_credentials'
    res = Faraday.post(@url + url, {client_id: ENV['ID_KEY'], client_secret: ENV['SECRET_KEY']})
    JSON.parse(res.body)['access_token']
  end

  def get_signature(path, verb, body)
    @token = get_access_token
    @timestamp = Time.now.utc.iso8601(3)
    payload = "path=" + path + "&verb=" + verb + "&token=Bearer " + @token +
                    "&timestamp=" + @timestamp + "&body=" + body
    puts payload
    create_signature(payload)
  end

  def create_signature(payload)
    digest = OpenSSL::Digest.new('sha256')
    key = ENV['SECRET_KEY']
    hexdigest = OpenSSL::HMAC.hexdigest(digest, key, payload)
    hex_to_base64_digest(hexdigest)
  end

  def hex_to_base64_digest(hexdigest)
    [[hexdigest].pack("H*")].pack("m0")
  end

  def connection
    connection = Faraday.new(:url => @url) do |c|
      c.use Faraday::Request::UrlEncoded
      c.use Faraday::Response::Logger
      c.use Faraday::Adapter::NetHttp
      connection
    end
  end
end