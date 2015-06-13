class AddAttachmentImageToSpecs < ActiveRecord::Migration
  def self.up
    change_table :specs do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :specs, :image
  end
end
