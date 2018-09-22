class CreateMqs < ActiveRecord::Migration[5.0]
  def change
    create_table :mqs do |t|

      t.belongs_to :month, foreign_key: true, null: false
      t.belongs_to :quarter, foreign_key: true, null: false, index: true

      t.string :name
      t.integer :demandPmin, unsigned: true # Predicted demand Range included Seasonality
      t.integer :demandPmax, unsigned: true # (demandP*(100+demandPer)*month.seasonPer/10000).round(0)
      # (the amount of demand exported from function taking into consideration randomness [rangeDemandPer])
      t.integer  :demandS, unsigned: true # demand from Simulation
      # the exact simulated demand will be within the demandP range
      t.timestamps
    end
    add_index :mqs, [:month_id, :quarter_id], unique: true
  end
end
