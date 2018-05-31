class AddDetailsToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :date, :string
    add_column :events, :price, :string
    add_column :events, :hours, :string
  end
end
