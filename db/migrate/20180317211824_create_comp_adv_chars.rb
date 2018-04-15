class CreateCompAdvChars < ActiveRecord::Migration[5.0]
  def change
    create_table :comp_adv_chars do |t|

      t.belongs_to :comp_adv, foreign_key: true, null: false
      t.belongs_to :adv_char, foreign_key: true, null: false

      t.integer :Seq, unsigned: true, limit: 1, null: false
      t.timestamps
    end
    add_index :comp_adv_chars, [:comp_adv_id, :adv_char_id], unique: true
    add_index :comp_adv_chars, [:comp_adv_id, :Seq], unique: true
    #same adv_char only once per adv and each Sequence only once used per adv
  end
end
