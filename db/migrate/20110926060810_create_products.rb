class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :name
      t.text :description
      t.string :size
      t.integer :price
       t.integer :size_id
      t.integer :occasion_id
      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
