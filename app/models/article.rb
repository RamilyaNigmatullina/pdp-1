class Article < ApplicationRecord
  belongs_to :user
  has_many :comments

  validates :title, :text, presence: true

  ratyrate_rateable "quality"
end
