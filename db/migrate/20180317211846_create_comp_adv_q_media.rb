class CreateCompAdvQMedia < ActiveRecord::Migration[5.0]
  def change
    create_table :comp_adv_q_media do |t|

      t.belongs_to :comp_adv_q, foreign_key: true, null: false
      t.belongs_to :adv_medium, foreign_key: true, null: false

      t.integer :appearancesNo, unsigned: true, limit: 1
      t.timestamps
    end
    add_index :comp_adv_q_media, [:comp_adv_q_id, :adv_medium_id], unique: true
  end
end
