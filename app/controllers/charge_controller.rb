class ChargeController < ApplicationController

  Stripe.api_key = 'sk_test_jDa79dlmKV3O1vdQwVFgsb7D002DL6Sd9A'

  def charge
    # byebug
    token = params[:token]
    amount = params[:amount]
    items = params[:items]

    response = Stripe::Charge.create({
      amount: amount,
      currency: 'usd',
      description: items,
      source: token
    })
  end

end
