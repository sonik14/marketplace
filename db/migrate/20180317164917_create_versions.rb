class CreateVersions < ActiveRecord::Migration[5.0]
  def change
    create_table :versions do |t|

      t.decimal  :rangeDemandMax, unsigned: true, precision: 3, scale: 2
      t.integer  :adv_lines_max, unsigned: true
      t.integer  :funding_amount_default, unsigned: true
      t.integer  :funding_amount_duration, unsigned: true, limit: 1, default: 5
      t.numrange :ill_percent_range
      t.timestamps
    end
  end
end
