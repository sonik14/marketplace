class CreateCompQs < ActiveRecord::Migration[5.0]
  def change
    create_table :comp_qs do |t|

      t.timestamps
    end
  end
end
