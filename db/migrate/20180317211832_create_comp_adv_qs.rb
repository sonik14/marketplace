class CreateCompAdvQs < ActiveRecord::Migration[5.0]
  def change
    create_table :comp_adv_qs do |t|

      t.belongs_to :comp_adv, foreign_key: true, null: false
   	  t.belongs_to :quarter, foreign_key: true, null: false
      # t.belongs_to :comp_q, foreign_key: true #instead of quarter

      t.integer :appearancesPPTot, unsigned: true
      t.integer :TotCPP, unsigned: true
      t.timestamps
    end
  	add_index :comp_adv_qs, [:quarter_id, :comp_adv_id], unique: true
  end
end
