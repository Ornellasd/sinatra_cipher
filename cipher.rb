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
  end
  output 
end

get '/' do
  erb :input
end

get '/output' do
  text = params["cipher-text"]
  shift = params["shift"]
  erb :output, :locals => { :output => cipherize('e', text, shift.to_i) }
end