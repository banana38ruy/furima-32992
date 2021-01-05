FactoryBot.define do
  factory :user do
    nick_name                       {Faker::Name.initials(number: 2)}
    email                          {Faker::Internet.free_email}
    password                       {"0000yuki"}
    password_confirmation          {password}
    first_name                     {"左ミギうしろ"}
    last_name                      {"前ウシロななめ"}
    first_name_kana                {"カカシ"}
    last_name_kana                 {"ナルト"}
    birthday                       {"1987-01-24"}
  end
end
