class WebApp < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  with_options presence: true do
    validates :name
    validates :description
    validates :language
    validates :free
    validates :link
    validates :edit_count, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 99, message: 'is invalid. edit_count must be 0-99 and half-width characters' }
    validates :image
  end
end
