# project euler question 42
# https://projecteuler.net/problem=42

require 'csv'
FILE_PATH = 'p042_words.txt'

$t_numbers, $n, $tn = [1], 1, 1

def get_sum_of_letters(word)
  word.split("").inject(0) { |sum, letter| sum + (letter.ord - 64) }
end

def generate_tns
  $tn = $n*($n+1)/2
  $t_numbers << $tn
  $n=$n+1
end

def check_if_coded_triangle?(sum)
  generate_tns while sum > $tn
  $t_numbers.include?(sum)
end

def get_words
  CSV.foreach(FILE_PATH) do |row|
    return row
  end
end

def get_triangle_words_count
  get_words.inject(0) {|count, word| check_if_coded_triangle?(get_sum_of_letters(word)) ? count+1 : count}
end

puts get_triangle_words_count
