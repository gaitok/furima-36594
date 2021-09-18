FactoryBot.define do
  factory :item do
    title               { 'タイトル' }
    text                { '商品説明' }
    category_id         { 2 }
    status_id           { 2 }
    price               { 1000 }
    postage_id          { 2 }
    place_id            { 3 }
    day_id              { 2 }
    association :user 

    after(:build) do |image|
      image.image.attach(io: File.open('public/images/image.png'), filename: 'image.png')
    end

  end
end
