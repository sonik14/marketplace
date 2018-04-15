class CreateCompQWebs < ActiveRecord::Migration[5.0]
  def change
    create_table :comp_q_webs do |t|

      t.belongs_to :comp_q, foreign_key: true, null: false
      t.belongs_to :continent, foreign_key: true, null: false
      #first comp_q in a specific continent => pay open cost
      #last consecutive comp_q "" (if not the end of the game) => pay close cost
      #other comp_qs => pay lease cost

      t.integer :TotNoE, unsigned: true
      t.integer :TotSalary, unsigned: true
      t.integer :TotIncome, unsigned: true
      t.integer :TotExpenses, unsigned: true #leitourgika
      t.integer :TotNoSales, unsigned: true #sums comp_prod_q_webs salesNo
      t.timestamps
    end
    add_index :comp_q_webs, [:continent_id, :comp_q_id], unique: true
  end
end
