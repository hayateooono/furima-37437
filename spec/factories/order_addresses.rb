FactoryBot.define do
  factory :order_address do
    post_code {'123-4567'}
    prefecture_id {1}
    city {'富山県'}
    address {'1-1'}
    building_name {'魚津ハイツ'}
    phone_number {11111111111}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
