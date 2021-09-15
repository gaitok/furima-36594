FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { 'test@example' }
    password              { '00000a' }
    password_confirmation { password }
    first_name            { '愛' }
    last_name             { 'うえお' }
    first_name_kana       { 'アイ' }
    last_name_kana        { 'ウエオ' }
    birthday              { '1931-01-01 0000' }
  end
end
