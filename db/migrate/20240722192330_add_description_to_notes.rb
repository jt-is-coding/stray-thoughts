class AddDescriptionToNotes < ActiveRecord::Migration[7.1]
  def change
    add_column :notes, :description, :text
  end
end
