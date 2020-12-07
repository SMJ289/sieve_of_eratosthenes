require 'minitest/autorun'
require 'minitest/pride'
require './lib/prime_number.rb'

class PrimeNumberTest < Minitest::Test
  def test_it_can_check_if_valid_input
    assert_equal true, PrimeNumber.valid_input?(1)
    assert_equal true, PrimeNumber.valid_input?(345)
    assert_equal false, PrimeNumber.valid_input?('five')
    assert_equal false, PrimeNumber.valid_input?(0)
    assert_equal false, PrimeNumber.valid_input?(-6)
    assert_equal false, PrimeNumber.valid_input?(6.7)
    assert_equal false, PrimeNumber.valid_input?([])
    assert_equal false, PrimeNumber.valid_input?({})
  end

  def test_it_can_set_prime_range
    range_1 = PrimeNumber.set_prime_range(6)
    range_2 = PrimeNumber.set_prime_range(100)
    assert_equal [2], range_1
    assert_equal [2, 3, 4, 5, 6, 7, 8, 9, 10], range_2
  end

  def test_it_can_check_prime
    # Handles valid inputs
    assert_equal true, PrimeNumber.is_prime?(5)
    assert_equal true, PrimeNumber.is_prime?(113)
    assert_equal false, PrimeNumber.is_prime?(6)
    assert_equal false, PrimeNumber.is_prime?(100)
    assert_equal false, PrimeNumber.is_prime?(4)
    # Handles invalid edge case inputs
    assert_equal false, PrimeNumber.is_prime?(-5)
    assert_equal false, PrimeNumber.is_prime?(0)
    assert_equal false, PrimeNumber.is_prime?('o')
  end

  def test_it_can_find_all_prime_numbers_in_range
    # Handles valid inputs
    test_case_1 = 5
    expected_1 = [2, 3, 5]
    test_case_2 = 120
    expected_2 = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53,
                  59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113]
    assert_equal expected_1, PrimeNumber.sieve_of_eratosthenes(test_case_1)
    assert_equal expected_2, PrimeNumber.sieve_of_eratosthenes(test_case_2)

    # Handles invalid edge case inputs
    test_case_3 = 'five'
    expected_3 = []
    test_case_4 = -5
    expected_4 = []
    assert_equal expected_3, PrimeNumber.sieve_of_eratosthenes(test_case_3)
    assert_equal expected_4, PrimeNumber.sieve_of_eratosthenes(test_case_4)
  end
end
