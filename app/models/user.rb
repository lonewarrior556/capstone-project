class User < ActiveRecord::Base
  validates :email, :username, presence: true
  validates :email, :username, uniqueness: true
  validate :valid_email, :password_length
  attr_reader :password, :avatar
  before_save :generate_session_token

  def self.find_by_login(params)
    user = User.find_by(username: params[:username])
    return nil if !user
    if BCrypt::Password.new(user.password_digest).is_password?(params[:password])
      return user
    end
    nil
  end

  has_many :questions,
  class_name: "Question",
  foreign_key: :user_id,
  primary_key: :id

  has_many :responses,
  class_name: "Responses",
  foreign_key: :user_id,
  primary_key: :id


  has_attached_file :avatar, :default_url => ":style/missing.jpg", :styles => { :medium => "300x300>", :thumb => "50x50>" }
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/





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
