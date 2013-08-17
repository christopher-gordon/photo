class AddOrderingToPictures < ActiveRecord::Migration
  def change
    change_table :pictures do |t|
      t.integer :ordering
    end
  end
end
