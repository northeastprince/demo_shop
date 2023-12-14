class OrdersController < ApplicationController
  def edit
    @order = Current.order
  end

  def create
    @order = Current.order.submit
    redirect_to root_path, notice: "Order submitted!"
  end
end
