FactoryGirl.define do
	factory :user do
		sequence(:name) { |n| "Person #{n}"}
		sequence(:screen_name) { |n| "screen#{n}" }
		sequence(:email) { |n| "person_#{n}@example.com" }
		password 		"foobar"
		password_confirmation "foobar"

		factory :admin do
			admin true
		end
	end
end