class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title
      t.text :description
      t.string :image_url
      t.references :user

      t.timestamps
    end
  end
end
