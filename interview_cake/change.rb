def real_change(amt, denoms)

end

def change(amt, denoms)
  result = []
  denoms.each do |coin|
    remainder = amt - coin
    next if remainder < 0

    if remainder == 0
      result << [coin]
    else
      change(remainder, denoms).each do |assortments|
        result << (assortments << coin)
      end
    end
  end

  result
end

puts change(2, [2,1]).inspect
puts change(15, [10,5,1]).inspect
puts change(4, [1,2,3]).inspect
