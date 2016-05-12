class AlterTeacherColumn < ActiveRecord::Migration
  
  def change
    # Add code to create the table here
    # HINT: check out ActiveRecord::Migration.create_table
    change_table :teachers do |t|
      t.date :last_student_added_at
      # column definitions go here
      # Use the AR migration guide for syntax reference
    end
  end

end
