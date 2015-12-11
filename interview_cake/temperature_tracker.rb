# You decide to test if your oddly-mathematical heating company is fulfilling its All-Time Max, Min, Mean and Mode Temperature Guarantee™.
# Write a class TempTracker with these methods:

# insert()—records a new temperature
# get_max()—returns the highest temp we've seen so far
# get_min()—returns the lowest temp we've seen so far
# get_mean()—returns the mean ↴ of all temps we've seen so far
# get_mode()—returns the mode ↴ of all temps we've seen so far
# Optimize for space and time. Favor speeding up the getter functions (get_max(), get_min(), get_mean(), and get_mode()) over speeding up the insert() function.

# get_mean() should return a float, but the rest of the getter functions can return integers. Temperatures will all be inserted as integers. We'll record our temperatures in Fahrenheit, so we can assume they'll all be in the range 0..1100..110.

# If there is more than one mode, return any of the modes.

class TempTracker
  def initialize
    @max = nil
    @min = nil
    @sum = 0
    @count = 0
    @mean = 0
    @temp_hash = Hash.new{0}
    @temp_mode = nil
    @temp_mode_count = 0
  end

  def insert(temp)
    @temp_hash[temp] += 1

    if @temp_hash[temp] >= @temp_mode_count
      @temp_mode = temp
      @temp_mode_count = @temp_hash[temp]
    end

    @mean = @sum / @count
    @sum += temp
    @count += 1
    @max = [max, temp].max
    @min = [min, temp].min
  end

  def get_max
    return @max
  end

  def get_min
    return @min
  end

  def get_mean
   return @mean
  end

  def get_mode
    return @temp_mode
  end
end


