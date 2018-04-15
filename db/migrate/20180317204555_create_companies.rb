class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|

      t.belongs_to :game, foreign_key: true, null: false, index: true
      t.integer :ceo_id
      t.belongs_to :continent, foreign_key: true #factory location

      t.string :name, unique: true, index: true #dont allow null in model though, null: false
      t.string :mission
      t.timestamps
    end
    add_foreign_key :companies, :users, column: :ceo_id, null: false
    add_index :companies, [:game_id, :ceo_id], unique: true, index: true
    # same user only up to 1 company per game
  end
end
