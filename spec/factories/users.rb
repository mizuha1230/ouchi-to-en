FactoryBot.define do
  factory :user do
    name                  { '山田太郎' }
    email                 { 'test@test.com' }
    password              { 'test12' }
    password_confirmation { password }
    id                    { 1 }
  end
end
