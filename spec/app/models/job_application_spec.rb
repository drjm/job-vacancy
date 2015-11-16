require 'spec_helper'

describe JobApplication do

	describe 'model' do

		subject { @job_offer = JobApplication.new }

		it { should respond_to( :job_offer) }
		it { should respond_to( :user) }
		it { should respond_to( :email) }

	end


	describe 'create_for' do
      
      let(:user) { User.new }

	  it 'should set job_offer' do
	  	user.email = 'algo@gmail.com'
	  	user.password = '1234'
	  	offer = JobOffer.new
	  	ja = JobApplication.create_for('algo@gmail.com', offer, user)
	  	ja.job_offer.should eq offer
	  end


	  it 'should set user ' do
	  	user.email = 'algo@gmail.com'
	  	user.password = '1234'
	  	offer = JobOffer.new
	  	ja = JobApplication.create_for('algo@gmail.com', offer, user)
	  	ja.user.should eq user
	  end

	  it 'should set email ' do
	  	user.email = 'algo@gmail.com'
	  	user.password = '1234'
	  	offer = JobOffer.new
	  	ja = JobApplication.create_for('algo@gmail.com', offer, user)
	  	ja.email.should eq user.email
	  end

	end


	describe 'process' do

	  let(:job_application) { JobApplication.new }
	  let(:user) { User.new }
	  it 'should deliver contact info notification' do
	    user.email = 'algo@gmail.com'
	  	user.password = '1234'
	  	ja = JobApplication.create_for('algo@gmail.com', JobOffer.new,user)
	  	JobVacancy::App.should_receive(:deliver).with(:notification, :contact_info_email, ja)
	  	ja.process
	  end

	end

end
