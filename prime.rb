def prime?(num)
  # Implements the Miller test as found at: 
  # https://en.wikipedia.org/wiki/Miller%E2%80%93Rabin_primality_test#Miller_test
  if num < 2 
    return false 
  elsif n % 2 == 0 
    return false 
  end
  
  # select bases using https://en.wikipedia.org/wiki/Miller%E2%80%93Rabin_primality_test#Testing_against_small_sets_of_bases
  a_vals = []
  case num 
    when < 2047
      a_vals = [2]
    when < 1373653
      a_vals = [2,3]
    when < 25326001
      a_vals = [2,3,5]
    when < 3215031751
      a_vals = [2,3,5,7]
    else 
      puts "Undefined for values >= 3,215,031,751"
      return nil 
  end
  
  # write num as 2**r * d + 1 with d odd (by factoring out powers of 2 from n − 1)
  d = num - 1 
  r = 1
  while to_factor.even? do
    d = d / 2 
    r += 1 
  end 
  # implement WitnessLoop from Miller test using predetermined array for values of a 
  a_vals.each do |a|
    x = (a ** d) % num 
    if x != 1 && x != num - 1 #otherwise, skip to next a 
      (r - 1).times do
        x = (x * x) % num 
        
      end 
    end 
  end 
end 
