def yellow_page (phone_string) 
    puts phone_string
bundle 
        puts "arg is 10 characters"
        name_string = ""
        phone_string.downcase.each_char do |letter|
            if letter == "a" || letter == "b" || letter == "c"
                name_string += '2'
            elsif letter == "d" || letter == "e" || letter == "f"
                name_string += '3'
            elsif letter == "g" || letter == "h" || letter == "i"
                name_string += '4'
            elsif letter == "j" || letter == "k" || letter == "l"
                name_string += '5'
            elsif letter == "m" || letter == "n" || letter == "o"
                name_string += '6'
            elsif letter == "p" || letter == "q" || letter == "r" || letter == "s"
                name_string += '7'
            elsif letter == "t" || letter == "u" || letter == "v"
                name_string += '8'
            elsif letter == "w" || letter == "x" || letter == "y" || letter == "z"
                name_string += '9'
            else
                name_string += letter
            end
        end
        puts name_string
        return true
    end
    
end


test_val = yellow_page("testingabc")
if test_val == true
    puts "return value true"
else
    puts "return value false"
end
test_val = yellow_page("testnum2")
if test_val == true
    puts "return value true"
else
    puts "return value false"
end
