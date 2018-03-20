class CreateCompUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :comp_users do |t|

      t.timestamps
    end
  end
end
