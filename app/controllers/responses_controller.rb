class ResponsesController < ApplicationController

  def create
    question_id = clean_params[:question_id]
    @response = Response.new(user_id: current_user.id)
    @response.question_id = question_id
    @response.body= clean_params[:body]
    if @response.save
      render json: @response
    else

    end
  end

  env["omniauth.auth"]

  def email
    message = "from: #{params[:name]} at email: #{params[:email]}, phone: #{params[:phone]}, message: #{params[:message]}"

    @client = Twilio::REST::Client.new ENV["twilio_account_sid"], ENV["twilio_auth_token"]
    @client.account.messages.create({
	:from => '+12015618850',
  :to => '2018005988',
  	:body => message,
  })


  end


private
  def clean_params
    params.require(:response).permit(:question_id,:body)
  end

end
