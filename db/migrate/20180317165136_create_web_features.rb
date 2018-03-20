class CreateWebFeatures < ActiveRecord::Migration[5.0]
  def change
    create_table :web_features do |t|

      t.timestamps
    end
  end
end
