FactoryBot.define do
  factory :web_app do
    name              { 'test_code' }
    description       { 'test_code' }
    language          { 'test_code' }
    free              { 'test_code' }
    link              { 'test_code' }
    edit_count        { '0' }
    association :user

    after(:build) do |web_app|
      web_app.image.attach(io: File.open('public/images/image0.jpeg'), filename: 'image0.jpeg')
    end
  end
end