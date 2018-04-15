class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|

      t.belongs_to :role, foreign_key: true, null: false #type of user

      t.string :username, unique: true, index: true, null: true
      #select email as username if its null
      t.string :first_name, null: false
      t.string :middle_name
      t.string :last_name, index: true, null: false

      t.timestamps
    end
  end
end
