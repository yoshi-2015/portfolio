class CreateMovieComments < ActiveRecord::Migration[5.2]
  def change
    create_table :movie_comments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :movie_id
      t.float :rate, default: 0
      t.integer :spoiler_status

      t.timestamps
    end
  end
end
