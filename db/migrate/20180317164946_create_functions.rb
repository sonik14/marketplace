class CreateFunctions < ActiveRecord::Migration[5.0]
  def change
    create_table :functions do |t|

      t.belongs_to :version, foreign_key: true, null: false
      t.belongs_to :function_usage, foreign_key: true, null: false

      t.string  :name, index: true, null: false
      t.string  :function, null: false
      t.string  :function_copy

      t.float   :parAmin
      t.float   :parAmax
      t.float   :parAdef
      t.string  :parAname
      t.integer :parAscale, unsigned: true

      t.float   :parBmin
      t.float   :parBmax
      t.float   :parBdef
      t.string  :parBname
      t.integer :parBscale, unsigned: true

      t.float   :parCmin
      t.float   :parCmax
      t.float   :parCdef
      t.string  :parCname
      t.integer :parCscale, unsigned: true

      t.float   :parDmin
      t.float   :parDmax
      t.float   :parDdef
      t.string  :parDname
      t.integer :parDscale, unsigned: true

      t.timestamps
    end
    add_index :functions, [:version_id, :function_usage_id, :name], unique: true
    add_index :functions, [:function_usage_id, :function], unique: true
  end
end
