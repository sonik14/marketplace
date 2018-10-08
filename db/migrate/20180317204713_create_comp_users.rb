class CreateCompUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :comp_users do |t|

      t.belongs_to :company, foreign_key: true, null: false, index: true
      t.belongs_to :user, foreign_key: true, null: false

      t.timestamps
    end
    add_index :comp_users, [:company_id, :user_id], unique: true
  end
end
