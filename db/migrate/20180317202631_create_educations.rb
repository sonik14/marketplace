class CreateEducations < ActiveRecord::Migration[5.0]
  def change
    create_table :educations do |t|

      t.belongs_to :version, foreign_key: true, null: false

      t.string :name, null: false
      t.integer :defaultCPP, unsigned: true #per person or per kit, item etc
      t.integer :duration, unsigned: true #if duration is 2 and it is chosen then in comp_q_trains will be
      #auto completed for the following 2 quarters, so as the user will not
      #be able to chose it again the next quarter due to the restraint
      t.timestamps
    end
    add_index :educations, [:version_id, :name], unique: true
  end
end
