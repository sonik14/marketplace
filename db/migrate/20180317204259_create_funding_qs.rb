class CreateFundingQs < ActiveRecord::Migration[5.0]
  def change
    create_table :funding_qs do |t|

#to be deleted
      t.timestamps
    end
  end
end
