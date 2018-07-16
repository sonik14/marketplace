class CreateCompProdQWebs < ActiveRecord::Migration[5.0]
  def change
    create_table :comp_prod_q_webs do |t|

      t.belongs_to :comp_prod_q, foreign_key: true, null: false
      # you can connect with comp_prod without any difference to the result
      # best automization though will be achieved with comp_prod_q
      t.belongs_to :comp_q_web, foreign_key: true, null: false

      t.integer :salesNo, unsigned: true #will sum up to comp_q_stores
      t.integer :TotC, unsigned: true #kostos proiontos*salesNo - will sum up to comp_q_stores
      t.integer :price, unsigned: true
      t.integer :discount, unsigned: true
      t.integer :Seq, unsigned: true #sequence in sorting products on website (1 first product etc)
      t.timestamps
    end
    add_index :comp_prod_q_webs, [:comp_prod_q_id, :comp_q_web_id], unique: true
    add_index :comp_prod_q_webs, [:comp_prod_q_id, :comp_q_web_id, :Seq], unique: true, name: 'index_comp_prod_q_webs_on_prod_q_and_web_and_Seq'
  end
end
