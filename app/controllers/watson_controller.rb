require 'json'
require 'ibm_watson/authenticators'
require 'ibm_watson/assistant_v2'
include IBMWatson

class WatsonController < ApplicationController

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

  def create_watson_session
    response = @assistant.create_session(
      assistant_id: "57c8f20a-d724-41cf-aaaf-1830d31ae3e3"
    )
    render json: response.result
  end

  def destroy_watson_session
    response = delete_session("57c8f20a-d724-41cf-aaaf-1830d31ae3e3", params.permit(:session_id))
    render json: response.result
  end

  def post_input_to_watson
    if params[:session_id]
      begin
        response = @assistant.message(
          assistant_id: "57c8f20a-d724-41cf-aaaf-1830d31ae3e3",
          session_id: params[:session_id],
          input: {
            text: params.require(:input),
            options: {
              return_context: true
            }
          }
        )
        render json: {original_response: response.result}
      rescue
        response2 = @assistant.create_session(
          assistant_id: "57c8f20a-d724-41cf-aaaf-1830d31ae3e3"
        )
        response = @assistant.message(
          assistant_id: "57c8f20a-d724-41cf-aaaf-1830d31ae3e3",
          session_id: response.result["session_id"],
          input: {
            text: params.require(:input),
            options: {
              return_context: true
            }
          }
        )
        render json: {session_id: response2.result.session_id, original_response: response.result}
      end
    else
      response = @assistant.create_session(
        assistant_id: "57c8f20a-d724-41cf-aaaf-1830d31ae3e3"
      )
      response2 = @assistant.message(
        assistant_id: "57c8f20a-d724-41cf-aaaf-1830d31ae3e3",
        session_id: response.result["session_id"],
        input: {
          text: params.require(:input),
          options: {
            return_context: true
          }
        }
      )
      render json: {session_id: response.result["session_id"], original_response: response2.result}
    end
  end

end
