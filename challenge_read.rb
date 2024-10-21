require_relative 'ar.rb'

product = Product.first
puts product.attributes

# COLUMN NAMES
# id, name, description, price, stock_quantity, category_id, created_at, updated_at

# The product table has a relation with the category table. This is because category_id is a foreign key to the category table.

# Total number of products
number_of_products = Product.count
puts "There are #{number_of_products} entries in the products table."

# Name of products that cost more than $10 and start with the letter C
products_above_10_with_c = Product.where('price > 10').where('name LIKE ?', 'C%').pluck(:name)
puts "Products above $10 with names starting with C: #{products_above_10_with_c.join(', ')}"

# Total number of products with low stock (less than 5 in stock)
low_stock_count = Product.where('stock_quantity < 5').count
puts "Total number of products with low stock: #{low_stock_count}"

# --- PART 2 --- #

# 1. Find the name of the category associated with one of the products (using "belongs to" association)
product_category = product.category # Access the associated category object
puts "The category for the product '#{product.name}' is '#{product_category.name}'"

# 2. Find a specific category and use it to build and persist a new product (without manually setting the foreign key)
category = Category.find_by(name: 'Beverages') 
new_product = category.products.build(name: 'Sparkling Water', description: 'like water, but bubly', price: 3.99, stock_quantity: 50)
if new_product.save
  puts "New product '#{new_product.name}' was successfully created in the '#{category.name}' category."
else
  puts "Failed to create new product: #{new_product.errors.full_messages.join(', ')}"
end

# 3. Find a specific category and locate all associated products over a certain price
category = Category.find_by(name: 'Beverages') 
expensive_products = category.products.where('price > 100')
puts "Products in the '#{category.name}' category with a price over $100: #{expensive_products.pluck(:name).join(', ')}"