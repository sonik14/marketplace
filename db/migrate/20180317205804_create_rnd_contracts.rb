class CreateRndContracts < ActiveRecord::Migration[5.0]
  def change
    create_table :rnd_contracts do |t|

      t.timestamps
    end
  end
end
