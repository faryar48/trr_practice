class Complement
  VERSION = 3

  def self.is_valid_dna?(dna_string)
    dna_string.split("").each do |letter|
      if letter != 'G' && letter != 'C' && letter != 'A' && letter != 'T'
        return false
      end
    end
    true
  end

  def self.of_dna(dna_string)
    raise ArgumentError if !is_valid_dna?(dna_string)

    complements = {
      'C' => 'G',
      'G' => 'C',
      'A' => 'U',
      'T' => 'A'
    }


    complements[dna_string] if dna_string.length == 1

    rna_complement = ''

    dna_string.split("").each do |letter|
      rna_complement << complements[letter]
    end
    rna_complement
  end
end
