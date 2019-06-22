class OrderItemsController < ApplicationController
  def update
    order_item = OrderItem.find(params[:order_item_id])

    order_item.quantity = params[:quantity]
    order_item.save

    pharmacy_id = order_item.order.pharmacy.id
    redirect_to pharmacy_path(pharmacy_id)
  end
end