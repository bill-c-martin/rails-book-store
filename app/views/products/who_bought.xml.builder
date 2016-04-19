xml.instruct! :xml, :version => "1.0"

xml.feed do
  xml.title "How bought #{@product.title}"
  xml.updated get_latest_order_timestamp

  xml.orders do
    @product.orders.each do |order|
      xml.order :id => order.id do
        xml.address order.address
        xml.total order.line_items.map(&:total_price).sum
        xml.payment order.pay_type

        xml.items do
          order.line_items.each do |line_item|
            xml.item do
              xml.title line_item.product.title
              xml.quantity line_item.quantity
              xml.price line_item.total_price
            end
          end
        end

        xml.author do
          xml.title order.name
          xml.email order.email
        end
      end
    end
  end
end
