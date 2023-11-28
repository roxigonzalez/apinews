class CreateArticles < ActiveRecord::Migration[7.1]
  def change
    create_table :articles do |t|
      t.string :author, null: true
      t.string :title, null: false
      t.text :description, null: false
      t.string :url, null: false
      t.string :url_to_image
      t.datetime :published_at
      t.text :content, null: false

      t.timestamps
    end
  end
end
