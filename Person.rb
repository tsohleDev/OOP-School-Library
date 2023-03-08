class Person
  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Math.random(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  # getters for @id, @name, and @age
  attr_reader :id
  attr_accessor :name, :age

  # setters for @name and @age

  def of_age?
    @age >= 18
  end
  # make is_of_age? private
  private :is_of_age?

  def can_use_services?
    @parent_permission || is_of_age?
  end
end
