require_relative 'nameable'

class Person < Nameable
  attr_reader :id, :rentals
  attr_accessor :name, :age

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Math.random(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
    super()
  end

  def of_age?
    @age >= 18
  end
  private :is_of_age?

  def can_use_services?
    @parent_permission || of_age?
  end

  def correct_name
    @name
  end
end
