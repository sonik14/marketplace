class CreateCompQPriors < ActiveRecord::Migration[5.0]
  def change
    create_table :comp_q_priors do |t|

      t.belongs_to :comp_q, foreign_key: true, null: false
      t.belongs_to :customer, foreign_key: true, null: false
      t.integer :Seq, unsigned: true, limit: 1 #sequence
      t.timestamps
    end
    add_index :comp_q_priors, [:comp_q_id, :Seq], unique: true
  end
end
