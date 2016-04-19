module ProductsHelper
  def get_latest_order_timestamp
    latest_order = @product.orders.sort_by(&:updated_at).last
    latest_order && latest_order.updated_at
  end
end
