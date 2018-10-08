class CreateFactoryCapacities < ActiveRecord::Migration[5.0]
  def change
    create_table :factory_capacities do |t|

      t.belongs_to :version, foreign_key: true, null: false

      t.integer :capacity, null: false, unsigned: true, index: true, limit: 2
      t.integer :cost, unsigned: true
      t.integer :noW, unsigned: true
      t.integer :units, unsigned: true
      t.timestamps
    end
    add_index :factory_capacities, [:version_id, :capacity], unique: true
  end
end
