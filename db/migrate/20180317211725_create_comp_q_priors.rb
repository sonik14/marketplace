class CreateCompQPriors < ActiveRecord::Migration[5.0]
  def change
    create_table :comp_q_priors do |t|

      t.timestamps
    end
  end
end
