class Course < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :section, :number, :name, :length

  def to_s
    "#{section}#{number} #{name}"
  end

  # DEBUGGING ONLY
  def self._create_random
    c = Course.new
    c.section = %w(GEN EDU TOM ACK ZZZ).sample
    c.number = Random.rand(100) * 10
    c.name = 3.times.map { %w(test random tom class word mastery debug development).sample }.join ' '
    c.length = %w(30 60 90 120).sample
    c.save
  end
end
