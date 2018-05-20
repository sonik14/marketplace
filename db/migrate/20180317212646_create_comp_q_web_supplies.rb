class CreateCompQWebSupplies < ActiveRecord::Migration[5.0]
  def change
    create_table :comp_q_web_supplies do |t|

      t.belongs_to :comp_q_web, foreign_key: true, null: false
      t.belongs_to :web_supply, foreign_key: true, null: false

      t.integer :SalesNo, unsigned: true #representative sales
      #when they sell a prod this is increased and salesNo in correspondin comp_prod_q_web also.
      t.integer :TotCost, unsigned: true
      t.timestamps
    end
    add_index :comp_q_web_supplies, [:comp_q_web_id, :web_supply_id], unique: true
  end
end
