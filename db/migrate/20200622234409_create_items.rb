class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :price, default: 0, null: false

      t.timestamps
    end
  end
end
