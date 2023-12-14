class ApplicationController < ActionController::Base
  before_action :set_current_order

  private

  def set_current_order
    if (order = Order.where(status: nil).find_by(id: cookies.signed[:order_id]))
      Current.order = order
    else
      Current.order = Order.create!
      cookies.permanent.signed[:order_id] = Current.order.id
    end
  end
end
