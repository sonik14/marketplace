class CreateCustGMqCities < ActiveRecord::Migration[5.0]
  def change
    create_table :cust_g_mq_cities do |t|

      t.belongs_to :cust_city, foreign_key: true, null: false
      t.belongs_to :mq, foreign_key: true, null: false

      t.integer  :demandP,    unsigned: true
      t.integer  :demandS,    unsigned: true
      # demand Predicted and actual Demand from Simulation
      # Simulation can be either executed once and then the demand is split to customers and cities 
      # OR it can be executed for every city and customer (this is selected for implementation)
      # So simulation runs between the range of demandP
      # (this is exported by rangeDemandPer found at relevant quarter)
      # if demandP=2000 and rangeDemandPer=10% then
      # simulation will export a number within 1900 and 2100
      t.integer  :revisits1S, unsigned: true
      t.integer  :revisits2S, unsigned: true
      t.integer  :revisits3S, unsigned: true
      # we take into consideration up to 3 revisits. After failure of finding stock, customer
      # 100% either will buy something else or nothing.
      # if you want to use more than 3 revisits add model cust_g_mq_cities_revisits (where number of rivisit is stored)
      
      # rebuys are connected with company, since it matters in the evaluation of the product
      # so rebuy Projected Number is only stored to comp_prod_q_cust_cities
      # the actual rebuy number is also stored there
      t.timestamps
    end
    add_index :cust_g_mq_cities, [:cust_city_id, :mq_id], unique: true, index: true
  end
end
