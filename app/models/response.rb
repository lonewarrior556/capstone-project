class Response < ActiveRecord::Base
  validates :question_id, :user_id, :body, presence: true
  validate :body_length
  before_save :sanitize


  belongs_to :question,
  class_name: "Question",
  foreign_key: :question_id,
  primary_key: :id

  belongs_to :user,
  class_name: "User",
  foreign_key: :user_id,
  primary_key: :id




private

  def body_length
    if self.body.length <1
      self.errors.add(:body,"needs to include a response")
    end
  end

  def sanitize
    self.body = Sanitize.fragment(self.body)
  end

end
