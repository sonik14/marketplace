class CreateFunctions < ActiveRecord::Migration[5.0]
  def change
    create_table :functions do |t|

      t.timestamps
    end
  end
end
