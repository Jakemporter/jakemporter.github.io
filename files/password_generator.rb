puts "============================"
puts "Password Generator"
puts "============================"
puts "How many characters?"
char_amount = gets.chomp
char_amount = char_amount.to_i
if char_amount < 8
  puts "Password should be at least 8 characters"
end
puts "Do you want special characters?"
$spec_char = gets.chomp
def character
  letters = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
  numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
  characters = ["`","!", "@", "#", "$", "%", "^", "&",  "*", "(", ")", "-", "_", "=", "+", "[", "{", "]", "}", "?", ">", "<", ",", ".", "/", '"', "'"]
  if $spec_char.downcase == "yes" || $spec_char.downcase == "y"
    i = rand(0..2)
    if i == 0
      caps = rand(0..1)
      if caps == 0
        i2 = rand(0..letters.length - 1)
        character = letters[i2]
      else
        i2 = rand(0..letters.length - 1)
        character = letters[i2].upcase
      end
    elsif i == 1
      i2 = rand(0..numbers.length - 1)
      character = numbers[i2]
    else
      i2 = rand(0..characters.length - 1)
      character = characters[i2]
    end
  else
    i = rand(0..1)
    if i == 0
      caps = rand(0..1)
      if caps == 0
        i2 = rand(0..letters.length - 1)
        character = letters[i2]
      else
        i2 = rand(0..letters.length - 1)
        character = letters[i2].upcase
      end
    else
      i2 = rand(0..numbers.length - 1)
      character = numbers[i2]
    end
  end
  character
end

password = []
i = 0
while i < char_amount
  password[i] = character
  i +=1
end

puts "Your new password:"
puts password.join

if char_amount < 11 
  pass_strength = "Weak"
elsif char_amount > 10 && char_amount < 16 && $spec_char.downcase != "yes" && $spec_char.downcase != "y"
  pass_strength = "Medium"
elsif char_amount > 10 && char_amount < 22
  pass_strength = "Strong"
elsif char_amount >= 22
  pass_strength = "Very Strong"
end
puts "Password Strength: #{pass_strength}"
sleep 10
system("clear")