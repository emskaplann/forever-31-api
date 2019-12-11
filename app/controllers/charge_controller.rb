class ChargeController < ApplicationController

  Stripe.api_key = 'sk_test_jDa79dlmKV3O1vdQwVFgsb7D002DL6Sd9A'

  def charge
    byebug
    token = params[:token]
    response = Stripe::Charge.create({
      amount: 999,
      currency: 'usd',
      description: 'Example charge',
      source: token
    })
  end

end
