class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :web_app
  validates :sentence, presence: true
end
