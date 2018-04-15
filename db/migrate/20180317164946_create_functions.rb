class CreateFunctions < ActiveRecord::Migration[5.0]
  def change
    create_table :functions do |t|

      t.belongs_to :version, foreign_key: true, null: false

      t.string :name, unique: true, index: true, null: false
      t.string :function, unique: true, null: false
      t.numrange :parA
      t.numrange :parB
      t.numrange :parC
      t.numrange :parD
      t.timestamps
    end
  end
end
