require_relative 'ar.rb'

10.times do
  # Generate and save a new category
  category = Category.create(
    name: Faker::Commerce.department
  )

  # Generate and save 10 products for this category
  10.times do
    category.products.create(
      name: Faker::Commerce.product_name,
      description: Faker::Lorem.sentence,
      price: Faker::Commerce.price(range: 10..100.0),
      stock_quantity: Faker::Number.between(from: 1, to: 100)
    )
  end
end

puts "10 categories and 10 products for each category have been created!"