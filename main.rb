require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'
require_relative 'book'

class App
  def initialize()
    @books = []
    @people = []
    @rentals = []
  end

  def list_books
    if @books.length.positive?
      @books.each do |book|
        puts "Title: #{book.title}, Author: #{book.author}"
      end
    else
      puts 'There are no books in the database'
    end

    puts "\n"
    main
  end

  def list_people
    if @people.length.positive?
      @people.each do |person|
        puts "[Person] ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
      end
    else
      puts 'There are no people in the database'
    end

    puts "\n"
    main
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    person_type = gets.chomp

    case person_type
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts "Invalid option \n\n"
      return main
    end

    puts "Person created successfully \n\n"
    main
  end

  def create_student
    print 'Age: '
    age = gets.chomp

    print 'Name: '
    name = gets.chomp

    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp
    parent_permission = parent_permission.downcase == 'y'

    student = Student.new(age, name, parent_permission: parent_permission)
    @people.push(student)
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp

    print 'Name: '
    name = gets.chomp

    print 'Specialization: '
    specialization = gets.chomp

    teacher = Teacher.new(age, specialization, name)
    @people.push(teacher)
  end

  def create_book
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    book = Book.new(title, author)
    @books.push(book)

    puts "Book created successfully \n\n"
    main
  end

  def create_rental
    if @people.empty? || @books.empty?
      puts "There are no people or books in the database \n\n"
      return main
    end

    puts 'Select a book from the following list by number'
    @books.each_with_index do |book, index|
      puts "#{index}) Title: #{book.title}, Author: #{book.author}"
    end

    book_index = gets.chomp.to_i

    puts 'Select a person from the following list by number (not id)'
    @people.each_with_index do |person, index|
      puts "#{index}) [Person] ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
    end

    person_index = gets.chomp.to_i

    print 'Date(DD/MM/YYYY): '
    date = gets.chomp

    rental = Rental.new(date, @people[person_index], @books[book_index])
    @rentals.push(rental)

    puts "Rental created successfully \n\n"
    main
  end

  def list_rentals
    print 'ID of person: '
    id = gets.chomp.to_i

    rentals = @rentals.filter { |rental| rental.person.id == id }
    if rentals.empty?
      puts 'No rentals found for that ID'
      return main
    end

    puts 'Rentals:'
    rentals.each do |rental|
      puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}"
    end

    puts "\n"
    main
  end

  def exit
    puts 'Thank you for using the app!'
  end

  def main
    instructions = ['1.List all Books', '2.List all People', '3.Create a Person', '4.Create a Book',
                    '5.Create a Rental', '6.List all Rentals for a given person id', '7.Exit']
    instructions.each do |instruction|
      puts instruction
    end

    navigate = gets.chomp.to_i

    { 1 => :list_books, 2 => :list_people, 3 => :create_person, 4 => :create_book, 5 => :create_rental,
      6 => :list_rentals, 7 => :exit }.each do |key, value|
      send(value) if navigate == key
    end
  end
end

my_app = App.new
my_app.main
