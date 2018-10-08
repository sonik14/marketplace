class CreateProdChars < ActiveRecord::Migration[5.0]
  def change
    create_table :prod_chars do |t|

      t.belongs_to :category_prod, foreign_key: true, null: false, index: true

      t.string :name, index: true, null: false
      t.integer :avail, unsigned: true, limit: 1, index: true, null: false, default: 1
      t.integer :cost, unsigned: true, null: false
      t.integer :initC, unsigned: true, default: 0 # initial cost for RnD
      t.integer :scale # 1to.. (too bad or absent, bad, mediocre, good, very good)
      # or -M/2 to M/2
      # ex: 1, 2, 5 (big difference between 1 and 5)
      t.integer :LifeE, unsigned: true # life expectancy in days
      t.integer :malfPerE, unsigned: true # malfunction percent
      t.timestamps
    end
    add_index :prod_chars, [:category_prod_id, :name], unique: true
    add_index :prod_chars, [:category_prod_id, :scale], unique: true
  end
end
