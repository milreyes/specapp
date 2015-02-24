class CreateSpecs < ActiveRecord::Migration
  def change
    create_table :specs do |t|
    	t.string :title
    	t.text :content

      t.timestamps
    end
  end
end
