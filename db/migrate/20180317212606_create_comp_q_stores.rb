class CreateCompQStores < ActiveRecord::Migration[5.0]
  def change
    create_table :comp_q_stores do |t|

      t.belongs_to :comp_q, foreign_key: true, null: false
      t.belongs_to :city, foreign_key: true, null: false
	    #first comp_q in a specific city => pay open cost
	    #last consecutive comp_q "" (if not the end of the game) => pay close cost
	    #other comp_qs => pay lease cost

      t.integer :TotNoE, unsigned: true
      t.integer :TotSalary, unsigned: true
      t.integer :TotIncome, unsigned: true
      t.integer :TotExpenses, unsigned: true #leitourgika
      t.integer :TotNoSales, unsigned: true
      t.timestamps
    end
    add_index :comp_q_stores, [:city_id, :comp_q_id], unique: true
  end
end
