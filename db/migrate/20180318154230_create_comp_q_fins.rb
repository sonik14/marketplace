class CreateCompQFins < ActiveRecord::Migration[5.0]
  def change
    create_table :comp_q_fins do |t|

      t.timestamps
    end
  end
end
