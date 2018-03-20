class CreateCompAdvs < ActiveRecord::Migration[5.0]
  def change
    create_table :comp_advs do |t|

      t.timestamps
    end
  end
end
