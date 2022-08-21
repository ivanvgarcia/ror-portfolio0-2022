class RenameTileToTitle < ActiveRecord::Migration[7.0]
  def change
    rename_column :posts, :tile, :title
  end
end
