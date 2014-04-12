class AddCloudinaryUrlToPictures < ActiveRecord::Migration
  def change
    change_table :pictures do |t|
      t.string :cloudinary_url
      t.string :cloudinary_public_id
    end
  end
end
