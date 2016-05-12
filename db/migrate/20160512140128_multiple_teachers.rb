class MultipleTeachers < ActiveRecord::Migration
  
  def change
    create_table :outlines do |t|
      t.references :student
      t.references :teacher
    end
  end

end
