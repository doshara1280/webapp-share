class DeclarationComment < ApplicationRecord
  belongs_to :user
  belongs_to :web_app_declaration
  validates :sentence, presence: true
end
