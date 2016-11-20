def sum_to(n)
  return nil if n < 0
  return 0 if n == 0
  n + sum_to(n - 1)
end

def add_numbers(nums_arr)
  return nil if nums_arr.length < 1
  return nums_arr.first if nums_arr.length == 1
  sum = 0
  sum += nums_arr.pop
  add_numbers(nums_arr) + sum
end

def gamma(n)
  return nil if n < 1
  return 1 if n == 1
  (n - 1) * gamma(n - 1)
end
