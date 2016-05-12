class Outline < ActiveRecord::Base

  belongs_to :student
  belongs_to :teacher

  after_create :update_teacher_score

  def update_teacher_score
    unless feedback.nil?
      # puts "hello"
      # binding.pry
      teacher.rating = Outline.where(teacher: teacher_id).average(:feedback)
      teacher.save
    end
  end


end