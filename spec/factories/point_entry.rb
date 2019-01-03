# frozen_string_literal: true

FactoryBot.define do
  factory :point_entry do
    value { rand(100..250) }
  end
end
