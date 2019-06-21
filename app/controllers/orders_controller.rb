class OrdersController < ApplicationController
  def create
    order = Order.create(pharmacy_id: params[:pharmacy_id], campaign_id: params[:campaign_id])

    campaign = Campaign.find(params[:campaign_id])

    campaign.products.each do |product|
      OrderItem.create(product_id: product.id, order_id: order.id, quantity: 0)
    end

    redirect_to pharmacy_path(params[:pharmacy_id])
  end
end