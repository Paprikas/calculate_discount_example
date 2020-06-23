class CreateRules < ActiveRecord::Migration[6.0]
  def change
    create_table :rules do |t|
      t.string :item_name
      t.integer :batch_size, default: 0, null: false
      t.integer :batch_price, default: 0, null: false

      t.timestamps
    end
  end
end
