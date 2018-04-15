class CreateCompProds < ActiveRecord::Migration[5.0]
  def change
    create_table :comp_prods do |t|

      t.belongs_to :comp_q, foreign_key: true, null: false
      t.integer :q_end_id, foreign_key: true, default: nil
      #comp_q: when product was created and in which company it belongs
      #q_end_id: when product is either deleted or modified (null when remaining unmodified)

      t.string :name, index: true, null: false
      t.timestamps
    end
    add_foreign_key :comp_prods, :quarters, column: :q_end_id
    add_index :comp_prods, [:name, :comp_q_id], unique: true
  end
end
