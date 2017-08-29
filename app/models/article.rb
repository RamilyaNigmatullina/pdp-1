class Article < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :ratings

  validates :title, :text, presence: true
end
