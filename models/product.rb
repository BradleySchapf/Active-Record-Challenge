class Product < ActiveRecord::Base
  # This AR object is linked with the products table.
  
  # A product has a many to one relationship with a category.
  # The products table has a category_id foreign key.
  # In other words, a product belongs to a category.
  belongs_to :category

  # Ensures all columns are being used
  validates :name, :description, :price, :stock_quantity, presence: true

  # Validate that the name is unique and has more than 3 characters
  validates :name, uniqueness: true, length: { minimum: 3 }

  
end