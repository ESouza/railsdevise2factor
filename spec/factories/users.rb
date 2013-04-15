# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name 'Eduardo Souza'
    email 'eduardo@eduardosouza.com'
    password '123456789'
    password_confirmation '123456789'
    # required if the Devise Confirmable module is used
    # confirmed_at Time.now
  end
end
