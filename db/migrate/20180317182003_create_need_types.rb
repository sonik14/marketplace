class CreateNeedTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :need_types do |t|

      t.timestamps
    end
  end
end
