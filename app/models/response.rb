class Response < ActiveRecord::Base
  validates :question_id, :user_id, :body, presence: true
  validate :body_length

  belongs_to :question,
  class_name: "Question",
  foreign_key: :question_id,
  primary_key: :id

  belongs_to :responder,
  class_name: "User",
  foreign_key: :user_id,
  primary_key: :id




private

  def body_length
    if self.body.length <1
      self.errors.add(:body,"needs to include a response")
    end
  end

end
