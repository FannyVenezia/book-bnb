class AddColumnsToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :title, :string
    add_column :books, :author, :string
    add_column :books, :genre, :string
    add_column :books, :editor, :string
    add_column :books, :published, :integer
    add_column :books, :description, :text
  end
end
