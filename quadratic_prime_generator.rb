# project euler question 27
# https://projecteuler.net/problem=27
# Find the product of the coefficients, a and b, for the quadratic expression that produces the maximum
# number of primes for consecutive values of n, starting with n = 0.

require 'prime'

def eqn(n, a, b)
  n*n + a*n + b
end


def quadratic_prime
  max, max_a, max_b = 0, 0, 0
  b_range = []
  (2..1000).each do |x|
    b_range << x if x.prime?
  end
  b_range.sort!.reverse!
  b_range.each do |b|
    (-1000..1000).each do |a|
      n = 0
      while true
        break if !eqn(n, a, b).prime?
        n += 1
      end
      max, max_a, max_b = n, a, b if n>=max
    end
  end
  puts "n = 0 to #{max}, a = #{max_a}, b = #{max_b}"
  puts "a*b = #{max_a*max_b}"
end

