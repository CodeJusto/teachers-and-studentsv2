class TeacherRating < ActiveRecord::Migration
  
  def change
    change_table :teachers do |t|
      t.integer :rating
    end

    change_table :outlines do |t|
      t.integer :feedback
    end
  end

end
