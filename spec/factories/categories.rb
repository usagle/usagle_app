FactoryBot.define do
  factory :category do
    name { 'Lorem Ipsum' }
  end

  factory :invalid_category, class: 'Category' do
    name { nil }
  end
end
