FactoryGirl.define do
    factory :user do
        name                    "Joe Riley"
        email                   "joe@example.com"
        password                "foobar"
        password_confirmation   "foobar"
    end
end
