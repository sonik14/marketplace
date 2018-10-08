class CreateVersions < ActiveRecord::Migration[5.0]
  def change
    create_table :versions do |t|

      t.integer  :mainNo, unsigned: true, index: true, null: false #1, 2, 3 etc (main versions)
      t.string   :name, unique: true, index: true, null: false #ex: 1.5
      t.decimal  :rangeDemandMin, unsigned: true, precision: 3, scale: 2, null: false
      t.decimal  :rangeDemandMax, unsigned: true, precision: 3, scale: 2, null: false
      t.integer  :adv_lines_max, unsigned: true, null: false
      t.integer  :funding_amount_default, unsigned: true, null: false
      t.integer  :funding_amount_duration, unsigned: true, limit: 1, default: 5, null: false
      t.decimal  :illPerRmin, unsigned: true, precision: 3, scale: 2, null: false
      t.decimal  :illPerRmax, unsigned: true, precision: 3, scale: 2, null: false
      t.integer  :durationMin, unsigned: true, limit: 1, null: false
      t.integer  :durationMax, unsigned: true, limit: 1, null: false
      t.integer  :durationDef, unsigned: true, limit: 1, null: false
      t.timestamps
    end
  end
end
