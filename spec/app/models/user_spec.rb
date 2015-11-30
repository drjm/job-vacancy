require 'spec_helper'

describe User do

	describe 'model' do

		subject { @user = User.new }

		it { should respond_to( :id) }
		it { should respond_to( :name ) }
		it { should respond_to( :crypted_password) }
		it { should respond_to( :email ) }
		it { should respond_to( :job_offers ) }
		it { should respond_to( :specialties ) }

	end

	describe 'valid?' do

	  let(:user) { User.new }

	  it 'should be false when name is blank' do
	  	user.email = 'john.doe@someplace.com'
	  	user.password = 'a_secure_passWord!'
	  	expect(user.valid?).to eq false
	  end


	  it 'should be false when email is not valid' do
	  	user.name = 'John Doe'
	  	user.email = 'john'
	  	user.password = 'a_secure_passWord!'
	  	expect(user.valid?).to eq false
	  end


	  it 'should be false when password is blank' do
	  	user.name = 'John Doe'
	  	user.email = 'john.doe@someplace.com'
	  	expect(user.valid?).to eq false
	  end

	  it 'should be true when all field are valid' do
	  	user.name = 'John Doe'
	  	user.email = 'john.doe@someplace.com'
	  	user.password = 'a_secure_passWord!'
	  	expect(user.valid?).to eq true
	  end


	  it 'specialties should equal to java' do
	  	user.specialties = "java"
	  	expect(user.specialties).to eq "java"
	  end


	end

	describe 'authenticate' do

		before do
			@password = 'password'
		 	@user = User.new
		 	@user.email = 'john.doe@someplace.com'
		 	@user.password = @password
		 	@user.access_count = 3
		 	@user.blocked = false
		end

		it 'should return 2 when password do not match' do
			email = @user.email
			password = 'wrong_password'
			User.should_receive(:find_by_email).with(email).and_return(@user)
			User.authenticate(email, password).should eq 2
		end

		it 'should return 1 when fails a password 2 times' do
			email = @user.email
			password = 'wrong_password'
			User.should_receive(:find_by_email).with(email).and_return(@user)
			User.authenticate(email, password)
			User.should_receive(:find_by_email).with(email).and_return(@user)
			User.authenticate(email, password).should eq 1
		end

		it 'should return 0 when fails a password 3 times' do
			email = @user.email
			password = 'wrong_password'
			User.should_receive(:find_by_email).with(email).and_return(@user)
			User.authenticate(email, password)
			User.should_receive(:find_by_email).with(email).and_return(@user)
			User.authenticate(email, password)
			User.should_receive(:find_by_email).with(email).and_return(@user)
			User.authenticate(email, password).should eq 0
		end

		it 'should user to be blocked when fails a password 3 times' do
			email = @user.email
			password = 'wrong_password'
			User.should_receive(:find_by_email).with(email).and_return(@user)
			User.authenticate(email, password)
			User.should_receive(:find_by_email).with(email).and_return(@user)
			User.authenticate(email, password)
			User.should_receive(:find_by_email).with(email).and_return(@user)
			User.authenticate(email, password)
			@user.blocked.should eq true
		end

		it 'should return nil when email do not match' do
			email = 'wrong@email.com'
			User.should_receive(:find_by_email).with(email).and_return(nil)
			User.authenticate(email, @password).should be_nil
		end

		it 'should return the user when email and password match' do
			email = @user.email
			User.should_receive(:find_by_email).with(email).and_return(@user)
			User.authenticate(email, @password).should eq @user
		end

	end

end

