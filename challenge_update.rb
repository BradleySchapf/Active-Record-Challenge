# Ensure ActiveRecord is set up and connected
require_relative 'ar.rb'

# Find all products with a stock quantity greater than 40
products_to_update = Product.where('stock_quantity > ?', 40)

# Loop through each product and increment the stock quantity by 1
products_to_update.each do |product|
  product.stock_quantity += 1
  if product.save
    puts "Updated product: #{product.name}, new stock quantity: #{product.stock_quantity}"
  else
    puts "Failed to update product: #{product.name}, errors: #{product.errors.full_messages.join(", ")}"
  end
end
