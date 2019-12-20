class ChargeController < ApplicationController

  Stripe.api_key = 'sk_test_jDa79dlmKV3O1vdQwVFgsb7D002DL6Sd9A'

  def charge
    token = params[:token]
    amount = params[:amount]
    items = "Product Ids: " + params[:items]

    # creating the order then for adopt fresh transactions
    @new_order = Order.create(user_id: current_user_id)
    ProductsUser.where(user_id: current_user_id).each do |cart|
      # creating transactions for each product user bought
      OrdersProduct.create(product_id: cart.product_id, order_id: @new_order.id)
    end

    # deleting all the cart after creating the order for cart
    ProductsUser.where(user_id: current_user_id).delete_all

    response = Stripe::Charge.create({
      amount: amount,
      currency: 'usd',
      description: items,
      source: token
    })
  end

end
