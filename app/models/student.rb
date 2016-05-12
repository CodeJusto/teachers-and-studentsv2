class Student < ActiveRecord::Base
  # implement your Student model here
  validates :age, numericality: {greater_than_or_equal_to: 3}
  validates :email, uniqueness: true, format: { with: /.\w{2}+@\w+\.\w+/}
  belongs_to :teacher

  def age
    (Date.today.year.to_i-1 - birthday.year.to_i)
  end

  def name
    first_name + " " + last_name
  end
end
