class Category < ActiveRecord::Base
  acts_as_nested_set :order => "name"
   has_many :category_products
   has_many :products, :through => :category_products
   
   validates_presence_of :name
end
