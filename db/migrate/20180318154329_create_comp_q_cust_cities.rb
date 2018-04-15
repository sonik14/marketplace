class CreateCompQCustCities < ActiveRecord::Migration[5.0]
  def change
    create_table :comp_q_cust_cities do |t|

      t.belongs_to :comp_q, foreign_key: true, null: false
      t.belongs_to :cust_city, foreign_key: true, null: false

      t.integer :noIllTot, unsigned: true #no of lost demand because of CURRENT shortage of stock
      t.integer :noResearchD, unsigned: true #demand from the research
      t.integer :noResearchB, unsigned: true #buys from the research depending on current company's products
      t.integer :noResearchSample, unsigned: true #sample of research
      t.decimal :noResearchBE, unsigned: true, precision: 3, scale: 2
      #expected actual buys extracted from the research and actual population and demand forecast
      t.timestamps
    end
    add_index :comp_q_cust_cities, [:comp_q_id, :cust_city_id], unique: true
  end
end
