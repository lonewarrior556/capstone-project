class User < ActiveRecord::Base
  validates :email, :username, :provider, presence: true

  validates :email, :username, uniqueness: {scope: :provider, message: "only one unique user per sign in provider"}

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

  def self.from_omniauth(auth)
      @user = User.find_by(auth_token: auth.credentials.token)
      return @user if @user

      @user = User.find_by(uid: auth.uid)
      if @user
        @user.auth_token = auth.credentials.token
        @user.oauth_expires_at = Time.at(auth.credentials.expires_at)
        return @user
      end
      @user = User.new
      @user.fname= auth.extra.raw_info.given_name
      @user.lname= auth.extra.raw_info.family_name
      @user.email= auth.extra.raw_info.email
      @user.username = @user.email.split("@")[0]
      @user.provider = auth.provider
      @user.uid = auth.uid
      @user.auth_token = auth.credentials.token
      @user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      @user.generate_session_token
      @user.password = SecureRandom.urlsafe_base64(8)
      return @user
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

    def generate_session_token
      self.session_token = SecureRandom.urlsafe_base64(16)
      self.session_token
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


end
