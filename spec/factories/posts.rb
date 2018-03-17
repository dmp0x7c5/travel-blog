# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    author { create(:user) }
    body FFaker::Lorem.paragraphs
    title FFaker::Lorem.sentence
  end
end
