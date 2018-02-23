# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence :email do |n|
      "#{n}-#{FFaker::Internet.email}"
    end
    password { FFaker::Internet.password(8) }

    trait :admin do
      role :admin
    end

    trait :regular_user
  end
end
