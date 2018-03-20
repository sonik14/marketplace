class CreateFinLineItems < ActiveRecord::Migration[5.0]
  def change
    create_table :fin_line_items do |t|

      t.timestamps
    end
  end
end
