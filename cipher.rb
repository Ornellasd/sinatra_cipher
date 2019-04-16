require 'sinatra'
require 'sinatra/reloader'

def cipherize(string, number)
  output = ""
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
  output 
end

get '/' do
  erb :input
end

get '/output' do
  text = params["cipher-text"]
  shift = params["shift"]
  binding.pry
  erb :output, :locals => { :output => cipherize(text, shift.to_i) }
end