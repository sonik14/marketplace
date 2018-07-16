class CreateCompProdQs < ActiveRecord::Migration[5.0]
  def change
    create_table :comp_prod_qs do |t|

      t.belongs_to :comp_prod, foreign_key: true, null: false
      t.belongs_to :quarter, foreign_key: true, null: false
      # t.belongs_to :comp_q, foreign_key: true #instead of quarter

      t.integer :productionSeq, unsigned: true, limit: 1
      t.integer :salesNo, unsigned: true
      t.integer :productionNo, unsigned: true
      t.integer :stockNo, unsigned: true
      t.integer :lostSalesNo, unsigned: true
      t.integer :clearanceSaleNo, unsigned: true
      t.integer :clearanceSalePrice, unsigned: true
      t.integer :productionStart, unsigned: true
      t.integer :productionStop, unsigned: true
      t.integer :TotIncomePP, unsigned: true
      t.integer :TotExpensesPP, unsigned: true
      t.integer :TotGrossMarginPP, unsigned: true
      t.integer :qualityEval, unsigned: true, limit: 1
      t.timestamps
    end
    add_index :comp_prod_qs, [:quarter_id, :comp_prod_id], unique: true
    add_index :comp_prod_qs, [:quarter_id, :productionSeq], unique: true
  end
end
