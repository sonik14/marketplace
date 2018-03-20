class CreateCompAdvChars < ActiveRecord::Migration[5.0]
  def change
    create_table :comp_adv_chars do |t|

      t.timestamps
    end
  end
end
