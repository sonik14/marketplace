class CreateCategoryAdvs < ActiveRecord::Migration[5.0]
  def change
    create_table :category_advs do |t|

      t.belongs_to :version, foreign_key: true, null: false

      t.string :name, unique: true, index: true, null: false
      t.integer :M, unsigned: true, limit: 1 #number of products in this category
      #number of different qualities in this category
      t.boolean :multiple, null: false, default: false
      t.boolean :comperable, null: false, default: true
      t.timestamps
    end
  end
end
