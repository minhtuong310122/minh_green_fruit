class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.integer :quantity
      t.string :description
      t.string :image
      t.references :category

      t.timestamps
    end
  end
end
