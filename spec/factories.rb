FactoryGirl.define do
	factory :user do
		name  			"Test Name"
		email 			"lisa@example.com"
		screen_name "screen_test"
		password 		"foobar"
		password_confirmation "foobar"
	end
end