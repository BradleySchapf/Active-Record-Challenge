# Ensure ActiveRecord is set up and connected
require_relative 'ar.rb'

# Find one of the products created in challenge_create.rb
# Example: Let's assume one of the products has the name 'Sample Product 1'

product_to_delete = Product.find_by(name: 'Product1')

if product_to_delete
  product_to_delete.destroy
  puts "Deleted product: #{product_to_delete.name}"
else
  puts "Product not found"
end
