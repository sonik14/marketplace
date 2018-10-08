class CreateCompQCustCities < ActiveRecord::Migration[5.0]
  def change
    create_table :comp_q_cust_cities do |t|

      t.belongs_to :company, foreign_key: true, null: false
      t.belongs_to :cust_city, foreign_key: true, null: false
      t.belongs_to :quarter, foreign_key: true
      # this table is created in advance for noRebuys, so when q_no exists in quarter table, assign the key above
      t.integer :q_no, unsigned: true

      t.integer :noIllTot, unsigned: true #no of lost demand because of CURRENT shortage of stock
      t.integer :noResearchD, unsigned: true #demand from the research
      t.integer :noResearchB, unsigned: true #buys from the research depending on current company's products
      t.integer :noResearchSample, unsigned: true #sample of research
      t.decimal :noResearchBE, unsigned: true, precision: 3, scale: 2
      #expected actual buys extracted from the research and actual population and demand forecast
      t.integer :noRebuysPositive, unsigned: true #rebuys that will occur with positive opinion
      t.integer :noRebuysNegative, unsigned: true #rebuys that will occur with negative opinion
      t.timestamps
    end
    add_index :comp_q_cust_cities, [:company_id, :cust_city_id, :quarter_id], unique: true, name: 'index_comp_q_cust_cities_on_comp_q_cust_city'
    add_index :comp_q_cust_cities, [:company_id, :cust_city_id, :q_no], unique: true, name: 'index_comp_q_cust_cities_on_comp_q_no_cust_city'
  end
end
