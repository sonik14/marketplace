class CreateCompQs < ActiveRecord::Migration[5.0]
  def change
    create_table :comp_qs do |t|

      t.belongs_to :company, foreign_key: true, null: false
      t.belongs_to :quarter, foreign_key: true, null: false

      t.decimal :fundingPer, unsigned: true, precision: 3, scale: 2
      # funding percent of funding max of table quarter chosen by admin

      t.integer :cash, unsigned: true
      t.integer :shares, unsigned: true
      t.integer :income, unsigned: true
      t.integer :expenses, unsigned: true
      t.integer :propertyInMoney, unsigned: true
      t.decimal :reliability, unsigned: true, precision: 3, scale: 2
      
      t.integer :noIllPer, unsigned: true #percent of expected current lost demand because of PREVIOUS shortage of stock
      t.integer :noIllTot, unsigned: true #ACTUAL no of lost demand because of CURRENT shortage of stock

      t.integer :salaryE, unsigned: true #employee

      t.integer :salaryW, unsigned: true #worker
      t.belongs_to :health_continent, foreign_key: true
      t.integer :vacationW, unsigned: true, limit: 1 #no of weeks
      t.decimal :pensionW, unsigned: true, precision: 3, scale: 2 #percent

      t.integer :facTotC, unsigned: true #factory total cost
      t.integer :capacityF, unsigned: true, limit: 2 #fixed
      t.integer :capacityEx, unsigned: true, limit: 2 #expected for next quarter
      t.integer :capacityO, unsigned: true, limit: 2 #operating
      t.integer :noW, unsigned: true
      t.integer :unitsF, unsigned: true
      t.integer :unitsO, unsigned: true
      t.integer :capacityOUsed, unsigned: true, limit: 2
      t.decimal :capacityOUsedPer, unsigned: true, precision: 3, scale: 2 #percent
      t.integer :capacityOUnused, unsigned: true, limit: 2
      t.decimal :capacityOUnusedPer, unsigned: true, precision: 3, scale: 2 #percent
      t.integer :overheadC, unsigned: true
      t.integer :changeoverC, unsigned: true
      t.decimal :changeoverPer, unsigned: true, precision: 3, scale: 2
      t.integer :improveChangeoverC, unsigned: true
      t.decimal :imrpoveChangeoverPer, unsigned: true, precision: 3, scale: 2

      t.integer :educationTotC, unsigned: true
      t.timestamps
    end
    add_index :comp_qs, [:company_id, :quarter_id], unique: true
  end
end
