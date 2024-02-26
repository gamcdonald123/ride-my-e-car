class CreateCars < ActiveRecord::Migration[7.1]
  def change
    create_table :cars do |t|
      t.decimal :price
      t.string :location
      t.string :category
      t.integer :seats
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
