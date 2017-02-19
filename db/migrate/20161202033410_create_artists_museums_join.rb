class CreateArtistsMuseumsJoin < ActiveRecord::Migration
  def change
    create_table :artists_museums, :id => false do |t|
	t.integer "artist_id"
	t.integer "museum_id"
    end
	add_index :artists_museums, ["artist_id", "museum_id"]
  end
end
