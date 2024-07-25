class RemoveColumnFromNotes < ActiveRecord::Migration[7.1]
  def change
    remove_column :notes, :image, :string
    remove_column :notes, :platforms, :string
    remove_column :notes, :title, :string
    remove_column :notes, :description, :text
  end
end
