require 'byebug'

def slow_anagrams?(str1, str2)
    first_anagrams = first_anagram(str1)
    return first_anagrams.include?(str2)
end

def first_anagram(str)
    return [str] if str.length == 1
    first_char = str[0]
    the_rest = str[1..-1]
    the_rest = first_anagram(the_rest)
    res = []
    the_rest.each do |anagram|
        (0..anagram.length).each do |i|
            res << (anagram.dup).insert(i, first_char)
        end
    end
    return res
end

# p first_anagram("cat")

def second_anagram?(str1, str2)
    str1.each_char.with_index do |char, i|
        str2_index = str2.index(char)
        unless str2_index
            return false
        else
            str2[str2_index] = ''
        end
    end
    return true if str2 == ''
end

p second_anagram?('elvis', 'lives') # true
p second_anagram?('gizmo', 'sally') # false