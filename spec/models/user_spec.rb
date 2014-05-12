require 'spec_helper'

describe User do
	it 'should be invalid without email' do
		user = FactoryGirl.create(:invalid_user)
		user.should_not be_valid
	end
end