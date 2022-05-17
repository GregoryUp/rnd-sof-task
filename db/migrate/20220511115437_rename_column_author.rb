class RenameColumnAuthor < ActiveRecord::Migration[7.0]
  def change
    rename_column :news, :author, :user_id
    add_column :news, :edited_times, :integer
  end
end
