class CreateInterests < ActiveRecord::Migration[5.0]
  def change
    create_table :interests do |t|

      t.belongs_to :version, foreign_key: true, null: false
      t.belongs_to :function, foreign_key: true
      # if function is null and is fixed interest rate, independent of amount of money

      t.string :name, null: false #usage
      t.decimal :interest, precision: 3, scale: 2
      t.timestamps
    end
    add_index :interests, [:version_id, :name], unique: true
  end
end
