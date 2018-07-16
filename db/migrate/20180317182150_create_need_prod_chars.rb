class CreateNeedProdChars < ActiveRecord::Migration[5.0]
  def change
    create_table :need_prod_chars do |t|

      t.belongs_to :need, foreign_key: true, index: true, null: false
      t.belongs_to :prod_char, foreign_key: true, index: true, null: false

      t.timestamps
    end
  end
end
