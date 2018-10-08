class CreateCompProdQCustCities < ActiveRecord::Migration[5.0]
  def change
    create_table :comp_prod_q_cust_cities do |t|

      t.belongs_to :comp_prod, foreign_key: true, null: false
      t.belongs_to :comp_q_cust_city, foreign_key: true, null: false

      t.integer :noD, unsigned: true #no of demand
      t.integer :noB, unsigned: true #no of buys
      t.integer :noNotBbutAvail, unsigned: true #no of demands, but did not procceed into buys for unexpected reasons
      t.integer :noIll, unsigned: true #no of lost demand because of CURRENT shortage of stock
      t.integer :noRebuysPositive, unsigned: true #rebuys that will occur with positive opinion
      t.integer :noRebuysNegative, unsigned: true #rebuys that will occur with negative opinion
      #how many of customers of that city who bought that product at the current quarter will rebuy depending on results of previous simulations,
      #hence if the product is rated as good quality => prefer that company, otherwise=> avoid it
      #(influence in product rating for that amount of customers)
      t.timestamps
    end
    add_index :comp_prod_q_cust_cities, [:comp_prod_id, :comp_q_cust_city_id], unique: true, name: 'index_comp_prod_q_cust_cities_on_cpqcc'
  end
end
