# frozen_string_literal: true

FactoryBot.define do
  factory :player do
    name { 'John' }

    trait :with_points do
      after :create do |player|
        create_list(:point_entry, 3, player: player)
      end
    end

    trait :with_max_points do
      after :create do |player|
        create(:point_entry, player: player, value: Player::MAX_ALLOWED_POINTS)
      end
    end
  end
end
