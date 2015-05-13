class Question < ActiveRecord::Base
  validates :user_id, :title, presence: true
  validate :title_less_than_255

  belongs_to :user,
  class_name: "User",
  foreign_key: :user_id,
  primary_key: :id

  has_many :responses,
  class_name: "Response",
  foreign_key: :question_id,
  primary_key: :id



private
  def title_less_than_255
    if self.title.length > 255
      self.errors.add(:title, "is too long")
    end
  end

end
