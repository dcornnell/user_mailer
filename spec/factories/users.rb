FactoryGirl.define do
	factory :user do |f|
		f.name {Faker::Name.name}
		f.email {Faker::Internet.email}
		f.password {Faker::Internet.password}
	end

	factory :invalid_user, class: User do |f|
		f.name {Faker::Name.name}
		f.email nil
		f.password {Faker::Internet.password}
	end

end
