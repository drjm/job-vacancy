class JobApplication

	include DataMapper::Resource

	# property <name>, <type>
	property :id, Serial
	property :user_id, Integer
	property :job_offer_id, Integer
	property :email, String
	belongs_to :user
	belongs_to :job_offer

	def self.create_for(email, offer, user)
		app = JobApplication.new
		app.email = email
		app.job_offer = offer
		app.user=user
		app.save
		app
	end

	def process
    JobVacancy::App.deliver(:notification, :contact_info_email, self)
  end

end
