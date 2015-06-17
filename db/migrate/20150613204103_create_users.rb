class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
 			t.string :email
 			t.string :password_hash
 			t.string :password_salt
 			t.boolean :admin # allows users to create/delete specs.   	

      t.timestamps
    end
  end
end
