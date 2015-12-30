class Hamming
  VERSION = 1

  def self.compute(string1, string2)
    raise ArgumentError if string1.length != string2.length
    return 0 if string1 == string2

    array1 = string1.split("")
    array2 = string2.split("")
    result = 0
    array1.each_with_index do |letter, i|
      result += 1 if array2[i] != letter
    end
    result
  end
end
