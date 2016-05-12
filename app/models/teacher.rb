class Teacher < ActiveRecord::Base
  validates :email, uniqueness: true
  validate :retirement_date_validity
  validate :retirement_date_check
  
  has_many :outlines
  has_many :students, through: :outlines

  after_save :retirement_date_nil

  def retirement_date_validity
    unless retirement_date.nil?
      retirement_date < Date.today
    end
  end

  def retirement_date_check
    if hire_date && retirment_date
      errors.add(:retirement_date, "Hire date must be before the retirement date") if (hire_date > retirement_date)
    end
  end

  def retirement_date_nil
    unless retirement_date.nil?
      self.students.all.each do |student| 
      student.teacher_id = nil 
      student.save
    end
    else
      # days_employed
    end
  end

  # def days_employed
  #   (Date.today.to_i - hire_date.to_i).day
  # end
end