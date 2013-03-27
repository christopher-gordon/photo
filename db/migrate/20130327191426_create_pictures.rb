class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :description
      t.string :filename
      t.string :content_type
      t.string :location
      t.string :binary_data

      t.timestamps
    end
  end
end
