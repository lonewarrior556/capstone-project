class User < ActiveRecord::Base
  validates :email, :username, presence: true
  validates :email, :username, uniqueness: true
  validate :valid_email, :password_length
  attr_reader :password
  before_save :generate_session_token

  def self.find_by_login(params)
    user = user.find_by(username: param[:username]) || (User.new)
    if BCrypt::Password.new(user.password_digest).is_password?(params[:password])
      return user
    end
    nil
  end

  has_many :questions,
  class_name: "Question",
  foreign_key: "user_id",
  primary_key: "id"




  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end


  private
    def valid_email
      if !(self.email =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i)
        self.errors.add(:email, "must be in proper format")
      end
    end

    def password_length
      if !(@password.nil? || @password.length > 5)
        self.errors.add(:password, "must be at least 6 characters")
      end
    end

    def generate_session_token
      self.session_token = SecureRandom.urlsafe_base64(16)
      self.session_token
    end

end
