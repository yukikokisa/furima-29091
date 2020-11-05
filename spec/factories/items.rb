FactoryBot.define do
  factory  :item do
     name                {Faker::Name.initials(number: 5 )}
     description         {Faker::Lorem.sentence}  
     category_id         {"2"}
     condition_id        {"2"}
     postage_player_id   {"2"}
     shipping_area_id    {"2"}
     shipping_date_id    {"2"}
     price               {"30000"}

     after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
     end
  end  
end