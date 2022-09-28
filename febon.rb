i = 0
j = 1
nt = 0
c= 1
n = gets.chomp().to_i
while(c<=n+1)
  if(c<=1)
    nt= c
  else
    puts nt
    nt=i+j
    i=j
    j=nt
  end
  c+=1
end
