class CreateAdvChars < ActiveRecord::Migration[5.0]
  def change
    create_table :adv_chars do |t|

      t.timestamps
    end
  end
end
