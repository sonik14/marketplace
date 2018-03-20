class CreateCompQStores < ActiveRecord::Migration[5.0]
  def change
    create_table :comp_q_stores do |t|

      t.timestamps
    end
  end
end
