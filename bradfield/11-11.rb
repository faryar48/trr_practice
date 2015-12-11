require 'active_support/core_ext/module/delegation'



module GrowingThing
  def grows?
    true
  end
end

module BreathingThing
  def breathes?
    true
  end
end



# abstract base class (activeracord base is one of those classes)
class Animal
  include GrowingThing # composition
  include BreathingThing # composition (if breathingthing also had methods that growingthing had, then breathingthing wins because it is last)
end

class Collar
  attr_reader :color

  def initialize(color)
    @color = color
  end

  def jingle_sound
    :clinking
  end
end


# Dog is a subclass of Animal
class Dog < Animal
  attr_reader :collar # meta (meta programs that run at the class level are called macro (another name for code that writes code))

  delegate :jingle_sound, to: :@collar # also meta programming

  # delegate replaces the code below
  # def jingle_sound
  #   @collar.jingle_sound
  # end

  def initialize(collar)
    @collar = collar
  end
end

collar = Collar.new(:red)
# p collar.color
puppy = Dog.new(collar)
p puppy.jingle_sound
# p puppy.breathes?
