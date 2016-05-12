class TeacherEducation < ActiveRecord::Migration
  
  def change
    # Add code to create the table here
    # HINT: check out ActiveRecord::Migration.create_table
    change_table :teachers do |t|
      t.date :hire_date
      t.date :retirement_date
      # column definitions go here
      # Use the AR migration guide for syntax reference
    end
  end

end
