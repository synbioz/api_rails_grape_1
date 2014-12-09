class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :manufacturer
      t.string :design
      t.string :style

      t.timestamps
    end
  end
end
