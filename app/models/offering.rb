class Offering < ActiveRecord::Base
  belongs_to :user
  belongs_to :course
  has_many :class_signups
  has_many :students, source: :user, through: :class_signups

  scope :available, -> { where('scheduled_at > ?', Time.now).where('size > signed_up') }

  def available?
    empty_seats? && scheduled_at >= Time.now
  end

  def empty_seats?
    size > signed_up
  end
end
