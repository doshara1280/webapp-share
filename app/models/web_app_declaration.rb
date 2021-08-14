class WebAppDeclaration < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  with_options presence: true do
    validates :name
    validates :description
    validates :days,
              numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 99,
                              message: 'is invalid. days must be 0-99 and half-width characters' }
  end
end
