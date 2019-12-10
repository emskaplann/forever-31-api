require 'json'
require 'ibm_watson/authenticators'
require 'ibm_watson/assistant_v2'
include IBMWatson

class ApplicationController < ActionController::API

  def initialize
    super()
    @authenticator = Authenticators::IamAuthenticator.new(
      apikey: ENV["ASSISTANT_APIKEY"]
    )

    @assistant = AssistantV2.new(
      version: "2019-02-28",
      authenticator: @authenticator
    )

    @assistant.service_url = "https://gateway.watsonplatform.net/assistant/api"
  end


  private

  # JWT TOKEN METHODS
    def token(user_id)
      payload = { user_id: user_id }
      JWT.encode(payload, hmac_secret, 'HS256')
    end

    def hmac_secret
      ENV["API_SECRET_KEY"]
    end

    def client_has_valid_token?
      !!current_user_id
    end

    def current_user_id
      begin
        token = request.headers["Authorization"]
        decoded_array = JWT.decode(token, hmac_secret, true, { algorithm: 'HS256' })
        payload = decoded_array.first
      rescue #JWT::VerificationError
        return nil
      end
      payload["user_id"]
    end

    def require_login
      render json: {error: 'Unauthorized Request - 401'}, status: :unauthorized if !client_has_valid_token?
    end
end
