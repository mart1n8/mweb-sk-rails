class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.string :slug, null: false
      t.references :article_category, null: false, foreign_key: true
      t.string :tags, array: true, default: []
      t.text :intro_text, null: false
      t.text :text
      t.references :user, null: false, foreign_key: true
      t.integer :views, default: 0
      t.integer :likes, default: 0
      t.timestamps
    end
  end
end
