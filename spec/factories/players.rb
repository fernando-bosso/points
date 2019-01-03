# frozen_string_literal: true

FactoryBot.define do
  factory :player do
    name { 'John' }

    trait :with_points do
      after :create do |player|
        create_list :point_entry, 3, player: player   # has_many
      end
    end
  end
end
