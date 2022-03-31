class OrdersController < ApplicationController
  def set_order
    @order = Order.find(session[:order_id])
    rescue ActiveRecord::RecordNotFound
    @order = Order.create
    session[:order_id] = @order.id
  end

  def create
    @order.add_meal(params)

    if @order.save
      redirect_to order_path
    else
      flash[:error] = 'There was a problem adding this item to your cart.'
      redirect_to @ordered_meal
    end
  end
end
