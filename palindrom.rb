n= gets.chomp().to_i
tmp= n
sum = 0
while n!=0
  rem=n%10
  n=n/10
  sum = sum*10+rem
end
if (tmp==sum)
  puts tmp
else
  puts "Not palindrome"
end
