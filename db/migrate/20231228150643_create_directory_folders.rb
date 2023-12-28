class CreateDirectoryFolders < ActiveRecord::Migration[7.0]
  def change
    create_table :directory_folders do |t|
      t.string :name
      t.boolean :hidden
      t.integer :visibility

      t.timestamps
    end
  end
end
