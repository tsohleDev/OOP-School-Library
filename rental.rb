class Rental
    attr_reader :id
    attr_accessor :date, :person, :book

    def initialize(date, person, book)
        @date = date

        @person = person
        person.rentals << self

        @book = book
        book.rentals << self
    end
end