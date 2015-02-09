class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.boolean :active
      t.integer :vendor_id
      t.float :unit_price
      t.integer :stock_qty
      t.integer :reserved_qty
      t.integer :min_qty

      t.timestamps
    end
  end
end
