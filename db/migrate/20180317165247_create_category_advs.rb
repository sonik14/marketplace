class CreateCategoryAdvs < ActiveRecord::Migration[5.0]
  def change
    create_table :category_advs do |t|

      t.timestamps
    end
  end
end
