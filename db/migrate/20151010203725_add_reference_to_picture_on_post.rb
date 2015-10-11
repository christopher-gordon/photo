class AddReferenceToPictureOnPost < ActiveRecord::Migration
  def change
    change_table :posts do |t|
      t.remove :picture_id
      t.references :picture, index: true
    end

    change_table :pictures do |t|
      t.references :post, index: true
    end
  end
end
