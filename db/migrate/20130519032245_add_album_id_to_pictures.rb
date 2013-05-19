class AddAlbumIdToPictures < ActiveRecord::Migration
  def change
   change_table :pictures do |t|
     t.integer :album_id
   end
  end
end
