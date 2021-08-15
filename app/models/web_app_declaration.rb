class WebAppDeclaration < ApplicationRecord
  belongs_to :user
  has_many :declaration_comments
  has_one_attached :image
  with_options presence: true do
    validates :name
    validates :description
    validates :days
  end
end
