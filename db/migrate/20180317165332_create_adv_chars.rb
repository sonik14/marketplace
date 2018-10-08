class CreateAdvChars < ActiveRecord::Migration[5.0]
  def change
    create_table :adv_chars do |t|

      t.belongs_to :category_adv, foreign_key: true, null: false, index: true

      t.string :name, index: true, null: false
      t.integer :avail, unsigned: true, limit: 1, index: true, null: false, default: 1

      t.integer :scale #1to.. (too bad or absent, bad, mediocre, good, very good)
      #ex: 1, 2, 5 (big difference between 1 and 5)
      
      t.belongs_to :prod_char, foreign_key: true, null: true, index: true
      t.boolean :acceptBetter, null: false, default: :true
      # Correlate an advertisment characteristic with a product characteristic (check for false advertisment also)
      # Example "big screen (larger than 19)" => it relates to screen 19inches
      # and since it is comparable and acceptBetter is true => the adv is valid for 19inches 21inches etc
      # If the name was "Big screen 21 inches", then acceptBetter had to be false and should not accept 23 inches.

      t.belongs_to :function, foreign_key: true, null: true, index: true
      # In case it is needed to get into consideration a function like a score.
      # For example, The most reliable product/company etc

      t.timestamps
    end
    add_index :adv_chars, [:category_adv_id, :name], unique: true
    add_index :adv_chars, [:category_adv_id, :scale], unique: true
  end
end
