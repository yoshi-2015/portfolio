class RenamePostImageIdColumnToLikes < ActiveRecord::Migration[5.2]
  def change
    rename_column :likes, :post_image_id, :movie_id
  end
end
