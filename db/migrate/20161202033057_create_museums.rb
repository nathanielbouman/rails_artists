class CreateMuseums < ActiveRecord::Migration
  def change
    create_table :museums do |t|
      t.string "name"
      t.string "permalink"
      t.integer "position"
      t.timestamps
    end
	add_index("museums", "permalink")
  end
end
