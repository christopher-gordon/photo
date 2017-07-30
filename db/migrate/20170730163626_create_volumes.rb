class CreateVolumes < ActiveRecord::Migration
  def change
    create_table :volumes do |t|
      t.string :name, :null => :false
      t.timestamps
    end

    add_column :posts, :volume_id, :integer
  end
end

