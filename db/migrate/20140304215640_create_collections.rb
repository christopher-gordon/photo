class CreateCollections < ActiveRecord::Migration
  def change
    create_table :collections do |t|
      t.string :name
    end

    change_table :albums do |t|
      t.references :collection
    end
  end
end
