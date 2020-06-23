class AddKindToRules < ActiveRecord::Migration[6.0]
  def change
    add_column :rules, :kind, :integer, default: 0, null: false
    add_column :rules, :basket_total_discount, :integer, default: 0, null: false
    add_column :rules, :discount, :integer, default: 0, null: false
  end
end
