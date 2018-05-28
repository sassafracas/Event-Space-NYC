class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.string :address
      t.references :location, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
