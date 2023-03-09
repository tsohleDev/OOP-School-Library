require_relative 'person'

class Student < Person
  attr_accessor :classroom

  def initialize(age, name, classroom, parent_permission: true)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def add_to_classroom(classroom)
    @classroom = classroom
    classroom.students << self
  end
end
