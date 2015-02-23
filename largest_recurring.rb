# project euler question 26.
# https://projecteuler.net/problem=26
# Find the value of d < 1000 for which 1/d contains the longest recurring cycle in its decimal fraction part.

def largest_rec(n)
  largest_length = 0
  number = 0
  3.upto(n).each do |x|
    remainders = []
    dividend = 1
    while true do
      remainder = (dividend % x)
      break if remainder.zero?
      if remainders.include?(remainder)
        length = remainders.count - remainders.find_index(remainder)
        if length > largest_length
          largest_length = length
          number = x
        end
        break
      end
      remainders << remainder
      dividend = dividend * 10
    end
    puts remainders.inspect
  end
  puts "largest_length: #{largest_length} for number: #{number}"
end
