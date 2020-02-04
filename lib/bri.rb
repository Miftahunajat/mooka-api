class Bri

  def initialize
    @url = 'https://sandbox.partner.api.bri.co.id/'
  end
  def get_access_token
    url = 'oauth/client_credential/accesstoken?grant_type=client_credentials'
    res = Faraday.post(@url + url, {client_id: ENV['ID_KEY'], client_secret: ENV['SECRET_KEY']})
    JSON.parse(res.body)['access_token']
  end

  def get_signature(path, verb, body)
    token = 'qwe'
    # @timestamp = Time.now.utc.iso8601(3)
    @timestamp = '2020-02-03T23:59:41.100Z'
    payload = "path=" + path + "&verb=" + verb + "&token=" + token +
                    "&timestamp=" + @timestamp + "&body=" + body
    create_signature(payload)
  end

  def create_signature(payload)
    digest = OpenSSL::Digest.new('sha256')
    # key = ENV['SECRET_KEY']
    key = 'qweqwe'
    hexdigest = OpenSSL::HMAC.hexdigest(digest, key, payload)
    hex_to_base64_digest(hexdigest)
  end

  def hex_to_base64_digest(hexdigest)
    [[hexdigest].pack("H*")].pack("m0")
  end
end