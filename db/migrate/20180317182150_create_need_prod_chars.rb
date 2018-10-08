class CreateNeedProdChars < ActiveRecord::Migration[5.0]
  def change
    create_table :need_prod_chars do |t|

      t.belongs_to :need, foreign_key: true, index: true, null: false
      t.belongs_to :prod_char, foreign_key: true, index: true, null: false

      t.decimal :weight, precision: 3, scale: 2 # the positive sums up to 1

      t.timestamps
    end
    add_index :need_prod_chars, [:need_id, :prod_char_id], unique: true
  end
end
