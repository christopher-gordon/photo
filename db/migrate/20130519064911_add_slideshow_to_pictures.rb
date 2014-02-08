class AddSlideshowToPictures < ActiveRecord::Migration
  def change
    change_table :pictures do |t|
      t.boolean :slideshow
    end
  end
end
