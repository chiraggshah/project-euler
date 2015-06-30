# project euler question 40
# https://projecteuler.net/problem=40

def find_champernowne_constant
  str, i = "0", 1

  while(str.length <= 1000000) do
    str << i.to_s
    i = i+1
  end

  product, i = 1, 1
  while(i<=1000000) do
    product = product * str[i].to_i
    i = i*10
  end
  puts product
end

find_champernowne_constant
