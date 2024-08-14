class AddSearchableContentToNotes < ActiveRecord::Migration[7.1]
  def change
    add_column :notes, :searchable_content, :text
  end
end
