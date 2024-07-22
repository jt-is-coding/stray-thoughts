class CreateGames < ActiveRecord::Migration[7.1]
  def change
    create_table :games do |t|
      t.string :title
      t.string :image
      t.string :platforms
      t.text :description
      t.integer :api_id

      t.timestamps
    end
  end
end
