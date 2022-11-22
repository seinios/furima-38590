FactoryBot.define do
  factory :consumer_buyer do
    post_code             { '123-4567' }
    address_id            { Faker::Number.between(from: 2, to: 48) }
    municipality          { '横浜市緑区' }
    address_number        { '青山1-1-1' }
    building              { '柳ビル103' }
    tel                   { '08012345678' }
    token                 { 'tok_abcdefghijk00000000000000000' }
  end
end