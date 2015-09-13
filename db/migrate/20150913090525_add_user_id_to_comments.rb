class AddUserIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :user_id, :references
  end
end
