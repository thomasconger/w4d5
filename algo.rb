# my_min
# Given a list of integers find the smallest number in the list.

# Example:

#     list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
#     my_min(list)  # =>  -5
# Phase I
# First, write a function that compares each element to every other element of the list. Return the element if all other elements in the array are larger.
# What is the time complexity for this function?


def my_min(list) # O(n^2)

  list.each do |l1|                     #O(n)
    smallest = true                     #1
    list.each do |l2|                   #O(n)
      smallest = false if l2 < l1       #1
    end
    return l1 if smallest               #2ish
  end


end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# puts my_min(list)

# Phase II
# Now rewrite the function to iterate through the list just once while keeping track of the minimum. What is the time complexity?


def my_minner(list)
  list.inject do |acc, ele|
    if ele < acc
      ele
    else
      acc
    end
  end
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# puts my_minner(list)

# Largest Contiguous Sub-sum
# You have an array of integers and you want to find the largest contiguous (together in sequence) sub-sum. Find the sums of all contiguous sub-arrays and return the max.

# Example:

#     list = [5, 3, -7]
#     largest_contiguous_subsum(list) # => 8

#     # possible sub-sums
#     [5]           # => 5
#     [5, 3]        # => 8 --> we want this one
#     [5, 3, -7]    # => 1
#     [3]           # => 3
#     [3, -7]       # => -4
#     [-7]          # => -7
# Example 2:

#     list = [2, 3, -6, 7, -6, 7]
#     largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])
# Example 3:

#     list = [-5, -1, -3]
#     largest_contiguous_subsum(list) # => -1 (from [-1])
# Phase I
# Write a function that iterates through the array and finds all sub-arrays using nested loops. First make an array to hold all sub-arrays. Then find the sums of each sub-array and return the max.


# def largest_contiguous_subsum(arr)

#   vars = []                                     #1
#   (1...arr.length+1).each do |right|              #n
#     (0...right).each do |left|                  #n
#       vars << arr[left...right]                  #1
#     end
#   end
#   vars.count
#   # vars.map! do |ele|       #n
#   #   ele.sum               #n
#   # end

#   # vars.max                  #n

# end

list = [5, 3, -7,12,16,13,88]
 # => 8

# Discuss the time complexity of this solution.

#0 (n^2)

# Phase II
# Let's make a better version. Write a new function using O(n) time with O(1) memory. Keep a running tally of the largest sum. To accomplish this efficient space complexity, consider using two variables. One variable should track the largest sum so far and another to track the current sum. We'll leave the rest to you.

def largest_contiguous_subsum(arr)

  #determine at each arr[i] if it is worth taking the hit on the negative numbers
  #if arr[i] > 0 and there have been no negative numbers, then we would keep incremening the max_sum
  #if arr[i] < 0, then we need to see if the next set of positive numbers is greater

  max_sum = -1.0/0.0
  running_sum = 0

  i = 0
  while i < arr.length
    running_sum += arr[i]
    max_sum = running_sum if running_sum > max_sum
    running_sum = 0 if running_sum < 0
    i += 1
  end
  max_sum

end


list = [-1,-10,-15,0]
puts largest_contiguous_subsum(list)

#     {pos} + {negative} + {positive numbers}
#      {negative} + {positive numbers} + {negative} + {positive numbers} + {negative} + {positive numbers}





# Get your story straight, and then explain your solution's time complexity to your TA.
