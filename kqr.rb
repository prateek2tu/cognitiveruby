
def two_sum(nums, target)
  dict = {}
  nums.each_with_index do |n, i|
    if dict[target - n]
      return dict[target - n], i
    end
    dict[n] = i
  end

end
nums = [2,7,11,15]
target = 9
puts two_sum(nums, target)
