FactoryBot.define do
  factory :buy_address do
    token { 'tok_abcdefghijk00000000000000000' }
    postcode           { '123-4567' }
    place_id           { 2 }
    city               { '渋谷' }
    block              { '何処' }
    building           { '1番地' }
    phone              { '1234567890' }
  end
end
