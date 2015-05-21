class Question < ActiveRecord::Base
  validates :user_id, :title, presence: true
  validate :title_less_than_255
  before_save :sanitize

  attr_accessor :responds

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

  def sanitize
    self.title = Sanitize.fragment(self.title)
    self.body = Sanitize.fragment(self.body,
    :elements => ['b','u','i','img','ul','li','font','div','font','ol','style','br','h1','h2','h3','h4','h5','h6'],
    :attributes =>
      {:all => ['color', 'style', 'background-color','size', 'face']},
    :css =>
      {:properties => ['background-color','text-align','color']})
  end


end
