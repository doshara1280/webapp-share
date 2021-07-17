FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    one_word_comment      { 'test_comment' }
    email                 { 'test@example' }
    password              { '1a1a1a' }
    password_confirmation { password }
  end
end
