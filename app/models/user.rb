class User
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :crypted_password, String
  property :email, String
  property :specialties, String
  property :date_blocked, DateTime
  property :blocked, Boolean
  property :access_count, Integer
  has n, :job_offers

  validates_presence_of :name
  validates_presence_of :crypted_password
  validates_presence_of :email
  validates_format_of   :email,    :with => :email_address

  def password= (password)
    self.crypted_password = ::BCrypt::Password.create(password) unless password.nil?	
  end

  def self.authenticate(email, password)
    user = User.find_by_email(email)
    if(user.nil?)
      return nil
    else
      if (user.time_has_passed?(60) and user.has_password?(password))
        user.access_count = 3
        user.save
        user
      else
        if(user.blocked)
          return 0
        else
          user.analize_to_block
          user.access_count
        end
      end
    end
  end

  def integer?
    return false
  end

  def has_password?(password)
    ::BCrypt::Password.new(crypted_password) == password
  end

  def analize_to_block
    if(self.access_count <= 1)
      self.blocked = true
      self.date_blocked = Time.now
      self.access_count = self.access_count - 1
    else
      self.access_count = self.access_count - 1
    end
    self.save
  end

  def time_has_passed?(seconds)
    if(not date_blocked.nil?)
      time_left = Time.now - date_blocked
      if(time_left >= seconds)
        reset
      else
        false
      end
    else
      true
    end
  end

  def reset
    self.blocked = false
    self.date_blocked = nil
    self.access_count = 3
    self.save
    true
  end

end
