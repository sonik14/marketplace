class CreateCategoryProds < ActiveRecord::Migration[5.0]
  def change
    create_table :category_prods do |t|
      
      t.belongs_to :version, foreign_key: true, null: false

      t.string :name, index: true, null: false
      t.integer :M, unsigned: true, limit: 1 #number of products in this category
      #number of different qualities in this category
      t.boolean :multiple, null: false, default: false
      t.boolean :compulsory, null: false, default: true
      t.boolean :comperable, null: false, default: true
      # if  0 => not comperable components
      # if  1 => comparable components.
      t.timestamps
    end
    add_index :category_prods, [:version_id, :name], unique: true
  end
end
