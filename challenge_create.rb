# Ensure ActiveRecord is set up and connected
require_relative 'ar.rb'

# 1. Create using `new` + `save`
product1 = Product.new(name: 'Product1', description: 'Description1', price: 10, stock_quantity: 5)
if product1.save
  puts "Product1 saved successfully"
else
  puts "Product1 could not be saved: #{product1.errors.full_messages.join(", ")}"
end

# 2. Create using `create` (creates and saves in one step)
product2 = Product.create(name: 'Product2', description: 'Description2', price: 20, stock_quantity: 10)
if product2.persisted?
  puts "Product2 saved successfully"
else
  puts "Product2 could not be saved: #{product2.errors.full_messages.join(", ")}"
end

# 3. Create using `create!` (raises an exception if not successful)
begin
  product3 = Product.create!(name: 'Product3', description: 'Description3', price: 30, stock_quantity: 15)
  puts "Product3 saved successfully"
rescue ActiveRecord::RecordInvalid => e
  puts "Product3 could not be saved: #{e.message}"
end

# Create a Product object that is missing required columns (e.g., no name or price)
product_invalid = Product.new(description: 'Missing Name and Price', stock_quantity: 5)

# Try to save and print the validation errors
unless product_invalid.save
  puts "Invalid Product could not be saved: #{product_invalid.errors.full_messages.join(", ")}"
end
