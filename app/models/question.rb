class Question < ActiveRecord::Base
  validates :user_id, :title, presence: true
  validate :title_less_than_255
  before_save :sanitize

  attr_accessor :responds

  belongs_to :user,
  class_name: "User",
  foreign_key: :user_id,
  primary_key: :id

  has_many :responses


def self.top25
  select("questions.*, count(responses.id) AS response_count")
  .joins(:responses)
  .group("questions.id")
  .order("response_count DESC")
  .limit(25)
end



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
      {:all => ['color', 'style', 'background-color','size', 'face', 'src','href']},
    :css =>
      {:properties => ['background-color','text-align','color']})
  end


end
