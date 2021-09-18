FactoryBot.define do
  factory :item do
    id { '1' }
    title               { 'タイトル' }
    text                { '商品説明' }
    image               { '/sample' }
    category_id         { 2 }
    status_id           { 2 }
    price               { 1000 }
    postage_id          { 2 }
    place_id            { 3 }
    day_id              { 2 }
    user_id             { 1 }
    created_at          { '2021-01-01 00:00:00.00000' }
    updated_at          { '2021-01-01 00:00:00.00000' }
    user
  end
end
