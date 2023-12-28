class AddDirectoryFolderIdToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :directory_folder_id, :integer
  end
end
