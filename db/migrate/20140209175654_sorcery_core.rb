class SorceryCore < ActiveRecord::Migration
  def change
    add_column :users, :crypted_password, :string, :null=>false
    add_column :users, :salt, :string, :null=>false

    add_index :users, :email, unique: true
  end
end
