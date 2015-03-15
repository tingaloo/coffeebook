FactoryGirl.define do
  factory :book do
    title "Gone Girl"
    author "Gillian Flynn"
    description "Murder or Worse"
    favorite_character "Ben"
    favorite_quotes " "

    trait :invalid do
      title nil
    end

    trait :updated do
      title "Gone Home"
      author "A Woman"
      description "An interactive Adventure Game to
      find the ultimate truth"
      favorite_character "Home"
      favorite_quotes "Gone Home"
    end
  end

end
