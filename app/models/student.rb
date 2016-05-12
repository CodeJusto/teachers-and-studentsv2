class Student < ActiveRecord::Base
  # implement your Student model here
  validates :age, numericality: {greater_than_or_equal_to: 3}
  validates :email, uniqueness: true, format: { with: /.*@.*\..*/}
  # validates :teacher_id, presence: true
  has_many :outlines
  has_many :teachers, through: :outlines


  before_save :teacher_working
  after_save :save_teacher, if: :teacher

  def age
    (Date.today.year.to_i-1 - birthday.year.to_i)
  end

  def name
    first_name + " " + last_name
  end

  def save_teacher
    teacher.last_student_added_at = Date.today
  end

  def teacher_working
    unless teacher.nil?
      teacher.retirement.nil?
    end
  end
end
