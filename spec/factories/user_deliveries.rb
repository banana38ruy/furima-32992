FactoryBot.define do
  factory :user_delivery do
    postal_code                {"390-0843"}
    prefecture_id              {2}
    municipalities             {"朝日村"}
    address                    {"3丁目6−59"}                     
    phone_number               {"09077077457"}
    price                      {3000}
    token                      {"tok_abcdefghijk00000000000000000"}
  end
end