class RemoveColumnFromNotes < ActiveRecord::Migration[7.1]
  def change
    remove_column :notes, :body, :text
  end
end
