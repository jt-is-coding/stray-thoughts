class CreateNotes < ActiveRecord::Migration[7.1]
  def change
    create_table :notes do |t|
      t.text :body
      t.references :author, null: false, foreign_key: { to_table: :users }
      t.references :parent, foreign_key: { to_table: :games }

      t.timestamps
    end
  end
end
