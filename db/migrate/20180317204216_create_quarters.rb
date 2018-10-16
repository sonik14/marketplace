class CreateQuarters < ActiveRecord::Migration[5.0]
  def change
    create_table :quarters do |t|

      t.belongs_to :game, foreign_key: true, null: false
      t.integer :q_no, null: false, index: true
      t.string :name

      t.decimal :rangeDemandPer, unsigned: true, precision: 2, scale: 0

      t.integer :fundingAmountMax, unsigned: true
      t.timestamps
    end
    add_index :quarters, [:game_id, :q_no], unique: true
  end
end
