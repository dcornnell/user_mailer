require 'spec_helper.rb'

describe UsersController do
	describe 'Get #index'
		it 'should render the index page' do
			get :index
			response.should render_template :index
		end
	describe 'Get #new' do
		it 'should asssign a new user to new_user' do
			new_user = FactoryGirl.create(:user)
			get :new
			assigns(:new_user).should_not eq(nil)
		end 

		it 'should renders the new page' do
			get :new
			response.should render_template :new
		end
	end

	describe 'Post #create' do
		context 'valid input' do
			it 'creates a new user' do
				user_attrs = FactoryGirl.attributes_for(:user)
				expect {
					post :create, user: user_attrs
				}.to change(User, :count).by(1)
			end

			it 'redirects to the homepage' do
			 get :index
			 response.should render_template :index
			end
		end
		context 'invalid input' do
			it 'doesnt create a new user' do
				user_attrs = FactoryGirl.attributes_for(:invalid_user)
				expect {
					post :create, user: user_attrs	
				}.to change(User, :count).by(0)
			end
			it 'redirects to the new user page' do
				get :new
				response.should render_template :new
			end
		end
	end


end


