class CreateAdvMedia < ActiveRecord::Migration[5.0]
  def change
    create_table :adv_media do |t|

      t.timestamps
    end
  end
end
