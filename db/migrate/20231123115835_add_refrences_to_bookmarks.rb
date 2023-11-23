class AddRefrencesToBookmarks < ActiveRecord::Migration[7.1]
  def change
    add_reference :bookmarks, :user, null: false, foreign_key: true
    add_reference :bookmarks, :venue, null: false, foreign_key: true
  end
end
