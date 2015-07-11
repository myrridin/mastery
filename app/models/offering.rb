class Offering < ActiveRecord::Base
  belongs_to :user
  belongs_to :course
  has_many :class_signups
  has_many :students, source: :user, through: :class_signups

  validates_presence_of :size, :location, :course_id, :scheduled_at

  before_destroy { class_signups.destroy_all }

  scope :available, -> { where('scheduled_at > ?', Time.now).where('size > signed_up') }

  def available?
    empty_seats? && scheduled_at >= Time.now
  end

  def empty_seats?
    size > signed_up
  end
end
