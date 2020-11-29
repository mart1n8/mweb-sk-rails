class CreateArticleCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :article_categories do |t|
      t.string :name, null: false
      t.string :slug
      t.string :logo
      t.timestamps
    end
  end
end
