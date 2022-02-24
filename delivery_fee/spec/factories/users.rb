# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { 'MyString' }
    zip_code { 'MyString' }
    email { 'email@host.com' }
  end
end
