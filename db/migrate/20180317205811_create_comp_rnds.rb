class CreateCompRnds < ActiveRecord::Migration[5.0]
  def change
    create_table :comp_rnds do |t|

      t.timestamps
    end
  end
end
