#globals
$global_var = 0

class Person
    def initialize(age, name = "Unknown", parent_permission = nil)
        @id = $global_var
        @name = name
        @age = age
        @parent_permission = parent_permission

        $global_var += 1
    end

    #getters for @id, @name, and @age
    attr_reader :id
    attr_reader :name
    attr_reader :age

    #setters for @name and @age
    attr_writer :name
    attr_writer :age

    def is_of_age?
        @age >= 18 ? true : false
    end
    #make is_of_age? private
    private :is_of_age?

    def can_use_services?
        @parent_permission && is_of_age?() ? true : false
    end
end