class AddPlatformsToNotes < ActiveRecord::Migration[7.1]
  def change
    add_column :notes, :platforms, :string
  end
end
