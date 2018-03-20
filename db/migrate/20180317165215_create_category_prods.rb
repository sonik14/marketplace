class CreateCategoryProds < ActiveRecord::Migration[5.0]
  def change
    create_table :category_prods do |t|

      t.timestamps
    end
  end
end
