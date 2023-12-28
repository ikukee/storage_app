class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :file_name
      t.string :file_type
      t.date :upload_date
      t.string :author
      t.date :modfied_date
      t.date :accessed_date
      t.boolean :hidden
      t.integer :visibility

      t.timestamps
    end
  end
end
