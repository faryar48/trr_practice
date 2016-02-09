require 'set'
require 'prime'
require 'pry'

class Raindrops
  VERSION = 1

  def self.convert(amt_drops)
    if Prime.prime?(amt_drops)
      # binding.pry
      prime_factors_arr = Set.new [amt_drops]
    else
      # binding.pry
      prime_factors_arr = Raindrops.prime_factors(amt_drops)
    end
    # binding.pry

    raindrops = ""
    raindrops += "Pling" if prime_factors_arr.include?(3)
    raindrops += "Plang" if prime_factors_arr.include?(5)
    raindrops += "Plong" if prime_factors_arr.include?(7)
    raindrops = amt_drops.to_s if raindrops.empty?
    raindrops
  end

  def self.prime_factors(amt_drops)
    prime_factors_arr = Set.new
    (2..Math.sqrt(amt_drops).to_i).to_a.each do |int|
      if amt_drops % int == 0
        prime_factors_arr.add(int)
        prime_factors_arr.add(amt_drops / int)
      end
    end
    prime_factors_arr
  end
end
