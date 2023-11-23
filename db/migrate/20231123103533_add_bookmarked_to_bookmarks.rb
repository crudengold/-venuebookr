class AddBookmarkedToBookmarks < ActiveRecord::Migration[7.1]
  def change
    add_column :bookmarks, :bookmarked, :boolean, default: false
  end
end
