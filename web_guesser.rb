require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(100)

get '/' do
  guess = params["guess"].to_i
  message = check_guess(guess)
  erb :index, :locals => {:number => SECRET_NUMBER, :message => message}
end

def check_guess(guess)
  if (guess - 5) > SECRET_NUMBER
    "Way too high!"
  elsif (guess + 5) < SECRET_NUMBER
    "Way too low!"
  elsif guess < SECRET_NUMBER
    "Too low!"
  elsif guess == SECRET_NUMBER
    "You got it right! The secret_number is #{SECRET_NUMBER}"
  elsif guess > SECRET_NUMBER
    "Too high!"
  end
end
