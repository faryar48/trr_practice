
require 'pry'

class Expecter

  attr_reader :error_message, :expected, :actual

  def initialize(actual)
    @actual = actual
    @passed = false
    @error_message = nil
  end

  def to_be(expected)
    @expected = expected
    @passed = @actual == @expected
    @error_message = "#{@expected} is not equal to #{@actual}"
  end

  def to_be_less_than(expected)
    @expected = expected
    @passed = @actual < @expected
    @error_message = "#{@expected} is not less than #{@actual}"
  end

  def to_be_between(lower, upper)
    @lower = lower
    @upper = upper
    @passed = (@lower..@upper).include?(@actual)
    @error_message = "#{@actual} is not between #{@lower} and #{@upper}"
  end

  def passed?
    @passed
  end
end

class Group
  def initialize(name, group_blk)
    @name = name
    @group_blk = group_blk
    @tests = []
  end

  def test(name, &blk)
    @tests.push(Test.new(name, blk))
  end

  def before_each(&blk)
    @before_blk = blk
  end

  def run
    self.instance_eval(&@group_blk)

    puts "Tests in Group #{@name} are currently running"
    @tests.each do |test|

      test.run(before: @before_blk)
    end
    puts ""
  end
end

class Test
  def initialize(name, test_blk)
    @name = name
    @test_blk = test_blk
    @expectations = []
  end

  def expect(actual)
    @exp = Expecter.new(actual)
    @expectations.push(@exp)
    @exp
  end

  def run(opts = {})
    self.instance_eval(&opts[:before]) if opts[:before]
    self.instance_eval(&@test_blk)

    if @expectations.all?(&:passed?)
      puts @name + " passed"
      return
    end

    @expectations.each do |exp|
      if !exp.passed?
        puts @name + " didn't pass"
        puts "FAILED: #{exp.error_message}"
      end
    end
  end
end

def test(name, &blk)
  test = Test.new(name, blk)
  test.run
end

def group(name, &blk)
  group = Group.new(name, blk)
  group.run
end

group "a" do
  a = 4

  before_each do
    @a = 6
    @b = 3
  end

  test "the first test" do
    @a = 50
    expect(@a + a).to_be(1)
    expect(1).to_be(1)
    nil
  end

  test "the second test" do
    puts @a
    expect(2).to_be(1)
    expect(@b).to_be(3)
  end
end

group "b" do
  test "the third test" do
    expect(2).to_be_less_than(1)
    expect(2).to_be_less_than(3)
  end

  test "the fourth test" do
    expect(2).to_be_between(1, 4)
    expect(2).to_be_between(0, 1)
  end
end
