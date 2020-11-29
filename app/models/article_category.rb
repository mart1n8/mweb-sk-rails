class ArticleCategory < ApplicationRecord
    mount_uploader :logo, ArticleCategoryLogoUploader

    extend FriendlyId
    friendly_id :name, use: :slugged

    validates :name, presence: { message: "^Názov kategórie článkov nemôže byť prázdny."}



end
