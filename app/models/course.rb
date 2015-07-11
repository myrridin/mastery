class Course < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :section, :number, :name, :length

  def to_s
    "#{section}#{number} #{name}"
  end
end
