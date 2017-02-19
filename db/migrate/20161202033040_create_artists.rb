class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string "name"
      t.string "permalink"
      t.integer "position"
      t.timestamps
    end
	add_index("artists", "permalink")
  end
end
