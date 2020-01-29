class RemoveprofileImageIdFromusers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :profile_image_id, :text
  end
end
