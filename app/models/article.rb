class Article < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :article_category
  belongs_to :user


  validates :title, presence: { message: "^Názov článku nemôže byť prázdny."}
  validates :article_category, presence: { message: "^Kategória článku nemôže byť prázdna."}
  validates :tags, presence: { message: "^Tagy článku nemôžu byť prázdne."}
  validates :intro_text, presence: { message: "^Úvod článku nemôže byť prázdny."}




end
