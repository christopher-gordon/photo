class AddTitleToPictures < ActiveRecord::Migration
  def change
    change_table :pictures do |t|
      t.string :title
    end
  end
end
