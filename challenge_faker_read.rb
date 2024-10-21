require_relative 'ar.rb'

# Find all categories in the database
categories = Category.all

# Iterate through each category
categories.each do |category|
  puts "Category: #{category.name}"
  
  # Find the associated products for this category
  category.products.each do |product|
    puts "  Product Name: #{product.name}, Price: $#{product.price}"
  end

  puts "------------------------" # Separator between categories for clarity
end

