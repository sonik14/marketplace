class CreateWebConts < ActiveRecord::Migration[5.0]
  def change
    create_table :web_conts do |t|

      t.timestamps
    end
  end
end
