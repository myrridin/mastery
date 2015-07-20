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

  # DEBUGGING ONLY
  def self._create_random
    o = Offering.new
    o.course = Course.all.sample
    o.size = Random.rand(20) + 10
    o.scheduled_at = Date.today + (rand(7)).days
    o.location = ['4th floor Cafe', '5th floor boardroom', 'Washington Station'].sample
    o.user = User.instructors.sample
    o.signed_up = 0
    o.save
  end
end
