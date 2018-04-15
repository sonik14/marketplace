class CreateCompProdChars < ActiveRecord::Migration[5.0]
  def change
    create_table :comp_prod_chars do |t|

      t.belongs_to :prod_char, foreign_key: true, null: false
      t.belongs_to :comp_q, foreign_key: true, null: false
      t.timestamps
    end
    add_index :comp_prod_chars, [:prod_char_id, :comp_q_id], unique: true
  end
end
