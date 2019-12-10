class WatsonController < ApplicationController

  def create_watson_session
    response = @assistant.create_session(
      assistant_id: "57c8f20a-d724-41cf-aaaf-1830d31ae3e3"
    )
    render json: response
  end

  def destroy_watson_session
    response = delete_session("57c8f20a-d724-41cf-aaaf-1830d31ae3e3", params.permit(:session_id))
    render json: response
  end

  def post_input_to_watson
    response = @assistant.message(
      assistant_id: "57c8f20a-d724-41cf-aaaf-1830d31ae3e3",
      session_id: params.require(:session_id),
      input: {
        text: params.require(:input),
        options: {
          return_context: true
        }
      }
    )
    render json: response
  end

end
