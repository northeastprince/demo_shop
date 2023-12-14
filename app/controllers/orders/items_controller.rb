class Orders::ItemsController < ApplicationController
  before_action :set_item, except: :create

  def create
    product = Product.find(params[:product_id])
    Current.order.items.add_from_product(product)

    redirect_back_or_to root_path
  end

  def update
    if @item.update(item_params)
      redirect_to cart_path
    else
      render "orders/edit", status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy!

    redirect_back_or_to cart_path
  end

  private

  def set_item
    @item = Current.order.items.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:quantity)
  end
end
