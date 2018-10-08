class CreateCompProdMqCustCities < ActiveRecord::Migration[5.0]
  def change
    create_table :comp_prod_mq_cust_cities do |t|
      #keep month stats
      t.belongs_to :mq, foreign_key: true, null: false
      t.belongs_to :comp_prod_q_cust_city, foreign_key: true, null: false

      t.integer :noD, unsigned: true #no of demand
      t.integer :noB, unsigned: true #no of buys
      t.integer :noNotBbutAvail, unsigned: true #no of demands, but did not procceed into buys for unexpected reasons
      t.integer :noIll, unsigned: true #no of lost demand because of previous shortage of stock
      t.integer :noRebuysSPositive, unsigned: true #rebuys simulation extracted with positive opinion
      t.integer :noRebuysSNegative, unsigned: true #rebuys simulation extracted with negative opinion
      t.timestamps
    end
    add_index :comp_prod_mq_cust_cities, [:mq_id, :comp_prod_q_cust_city_id], unique: true, name: 'index_comp_prod_mq_cust_cities_on_cpmqcc'
  end
end
