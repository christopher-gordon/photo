class AddOrderingToAlbums < ActiveRecord::Migration
  def change
    change_table :albums do |t|
      t.integer :ordering
    end
  end
end
