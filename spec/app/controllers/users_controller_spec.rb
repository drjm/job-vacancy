require 'spec_helper'

describe "UsersController" do

	describe 'get :register' do
		
	  it "should response ok" do
	  	JobVacancy::App.any_instance.should_receive(:render).with('users/new')
	  	get '/register'
	    last_response.should be_ok
	  end

	  it 'should render users/new' do
	  	JobVacancy::App.any_instance.should_receive(:render).with('users/new')
	  	get '/register'
	  end

	 end

	describe 'get :profile' do
	  it "should response ok" do
	  	JobVacancy::App.any_instance.should_receive(:render).with('users/user_profile')
	  	get '/profile'
	    last_response.should be_ok
	  end

	  it "should render users/user_profile" do
	 	  JobVacancy::App.any_instance.should_receive(:render).with('users/user_profile')
	  	  get '/profile'
	  end

	end

	describe 'get :go_the_edit' do
	  it 'should response ok' do
	  	JobVacancy::App.any_instance.should_receive(:render).with('user_profile_edit')
	  	get '/edit'
	    last_response.should be_ok
	  end
	end
end
