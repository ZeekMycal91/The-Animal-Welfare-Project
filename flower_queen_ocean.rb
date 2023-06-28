# The Animal Welfare Project

#include <stdio.h>

class Animal 
  attr_accessor :name, :species, :age #Creates getters and setters for each of these attributes
  
  def initialize(name, species, age) #Constructor method that stores the attributes as an instance
    @name = name 
    @species = species
    @age = age
  end
end

class Shelter
  attr_accessor :name, :address, :animals #Creates getters and setters for these attributes
  
  def initialize(name, address) #Constructor method that initializes the attributes as an instance
    @name = name
    @address = address
    @animals = [] #Creates an array of animals in the shelter
  end
  
  def add_animal(animal) #Method that adds an animal to the shelter
    @animals.push(animal)
  end
  
  def list_animals #Method to list all animals in the shelter
    puts "Animals in the #{@name} shelter:"
    @animals.each do |animal|
      puts animal.name
    end
  end
  
  def adopt_animal(animal_name) #Method to adopt an animal from the shelter
    @animals.each do |animal| #Iterates through the array of animals
      if animal.name == animal_name # finds the given animal in the list
        @animals.delete(animal) # deletes it from the list
        puts "You just adopted #{animal.name}, a #{animal.species}, aged #{animal.age}"
        break #Breaks out of the loop 
      end
    end
  end
end

#Create some animals
animal1 = Animal.new("Slinky", "dog", 5)
animal2 = Animal.new("Whiskers", "cat", 2)

# Create a shelter
shelter1 = Shelter.new("Dogs and Cats Home", "123 Street")

# Add the animals to the shelter
shelter1.add_animal(animal1)
shelter1.add_animal(animal2)

# List all animals in the shelter
shelter1.list_animals

# Adopt an animal
shelter1.adopt_animal("Slinky")