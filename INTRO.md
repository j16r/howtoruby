# Intro to Ruby

This is a very simple script of topics to discuss while using IRB to introduce Ruby.

## Literals

    1 => Fixnum
    '' => String
    "" => Interpolated strings

## Methods

    puts 'x'
    1 + 1
    2 == 3

## Logic

    if 1 == 2
      puts 1
    end

## Everything is an expression

    if 1 == 2
      10
    else
      13
    end

  => 13

## Variables

    x = 1
    puts x
    y = "Hello"
    puts y

## Collections

    x = [1, 2, 3]
    x[0]
    y = {x: 1}
    y[:x]

## Enumeration

    x.each {|a| puts a}
    y.each {|key, value| puts value}

## More enumeration methods

    z = [1, 2, 3]
    total = 0
    z.each {|value| total += value}
    z.inject {|sum, value| sum + value}
    z.inject(&:+) # Kestrels!

## Everything is an object

    x.methods
    x.methods - Object.methods
    x.methods.grep /each/

## Defining objects

    class MyClass
    end

    MyConstant = Class.new(RuntimeError)

## Methods

    def mymethod
    end

    def mymethod
      puts 'X'
    end

## Attr accessors

    attr_reader :x
    attr :x

    def x
    @x
    end

## Saving state

    def mymethod
    @x = 1
    end

## Arguments

    def save(y)
    @y = 1
    end

## Splat:

    def save(\*args)
      args[0]
    end

## Last argument as hash shorthand:

    def save(x)

    save(x: 1, y: 2)

## Optional arguments (not native ruby):

    def x, options = {}
      options = {
        default: 1}.merge(options)

## Constructor:

    def initialize(x, y)
    @x, @y = x, y
    end

## Class methods:

    def self.x

    def MyClass.x

    extend << self

      def x

    end

## Private/protected methods:

    private
    protected

## Blocks

    def x
      puts "Before"
      yield
      puts "After"
    end

    x do
    end

## Passing blocks down the chain

    def x(&block)
      y(&block)
    end

## Passing arguments to blocks:

    x do |arg1|
    ...

## Exceptions:

    1 / 0
    => ZeroDivisionError

## Raise an exception:

    raise ArgumentError.new("The price is wrong!")

## Rescuing exceptions:

    begin
    # exceptional code
    rescue => e
      puts e
    end

_DON'T DO THIS:_

    rescue Exception

## Nice shorthand for creating app exceptions

    InvalidUserError = Class.new(RuntimeError)

## Finally:

    begin
    rescue => e
    ensure
      @x = 1
      # This is never returned
    end

## Advanced:

Mixins (include vs extend)
Reflection (self.class, method, instance_methods)
Cracking classes
Method missing/method defined
Meta-programming with instance_eval/define_method
Alias method
Lazy enumerators (new!)
