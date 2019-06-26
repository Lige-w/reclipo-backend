class ApplicationController < ActionController::API

  def secret_key
    'S3kr12'
  end

  def encode_token(paylod)
    JWT.encode(payload, secret_key)
  end

  def
    JWT.decode(token, secret_key)[0]
  end
end
