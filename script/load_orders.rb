# Run with rails runner script/load_orders.rb

# Populate db with 100 orders
Order.transaction do
  (1..100).each do |i|
    Order.create(
      name: "Customer #{i}",
      address: "#{i} Main Street",
      email: "customer-#{i}@example.com",
      pay_type: "Check"
    )
  end
end