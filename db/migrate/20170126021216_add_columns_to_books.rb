class AddColumnsToBooks < ActiveRecord::Migration
  def change
    add_column :books, :title, :string
    add_column :books, :description, :string
  end
end
