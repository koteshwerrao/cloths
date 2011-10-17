class CreateCategoryProducts < ActiveRecord::Migration
  def self.up
    create_table :category_products,:id=>false  do |t|
      t.integer :category_id
      t.integer :product_id
      t.timestamps
    end
  end

  def self.down
    drop_table :category_products
  end
end
