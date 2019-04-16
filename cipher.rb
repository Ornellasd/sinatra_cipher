require 'sinatra'
require 'sinatra/reloader'

def cipherize(operation, string, number)
  output = ""

  if operation == "encrypt" || operation == "e"
    string.split("").each do |letter|
      if letter.ord == 32
        output += 32.chr
      elsif letter.ord + number > 122
        output += (letter.ord + number - 26).chr
      elsif letter.ord + number < 97
        output += (letter.ord + number + 27).chr
      else
        output += (letter.ord + number).chr
      end  
    end
  elsif operation == "decrypt" || operation == "d"
    string.split("").each do |letter|
      if letter.ord == 32
        output += 32.chr
      elsif letter.ord - number > 122
        output += (letter.ord - number - 26).chr
      elsif letter.ord - number < 97
        output += (letter.ord - number + 26).chr
      else
        output += (letter.ord - number).chr
      end
    end
  else
    print "Error!"
  end
  print(output) 
end

get '/' do
  erb :index
end