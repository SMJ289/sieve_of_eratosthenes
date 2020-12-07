class PrimeNumber
  def self.sieve_of_eratosthenes(max_num)
    return [] if !(self.valid_input?(max_num))
    sieve_range = self.set_sieve_range(max_num)
    sieve_range.find_all do |num|
      is_prime?(num)
    end
  end

  private

  def self.set_prime_range(max_num)
    (2..Math.sqrt(max_num)).to_a
  end

  def self.set_sieve_range(max_num)
    (2..max_num).to_a
  end

  def self.is_prime?(max_num)
    return false if !(self.valid_input?(max_num))
    self.set_prime_range(max_num).none? do |int|
      max_num % int == 0
    end
  end

  def self.valid_input?(max_num)
    if max_num.class != Integer
      false
    elsif max_num <= 0
      false
    else
      true
    end
  end
end

# given a number N, return all prime numbers less than or equal to N

# Pseudocode:
# look up how to check if a number is prime
# divisible by one or itself
# % == 0
# looking for all prime numbers less or equal given varible
# generate a range using n
# loop over that range
# check % == 0 range
# if true
# acc = [] <<
# return acc
