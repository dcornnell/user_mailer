require 'spec_helper'

describe User do
	it 'should be invalid without email' do
		FactoryGirl.create(:invalid_user).should_not be_valid
	end
end