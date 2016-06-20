require 'sinatra'

get '/' do
  guess = params["guess"]
  message = check_guess(guess)
  erb :index, {locals: {message: message, color: @color}}
end

def check_guess(guess)
  if guess.nil?
    $secret_number = rand(100)
    @color = "skyblue"
    return "Take a guess!"
  end

  guess = guess.to_i
  if (guess - 5) > $secret_number
    @color = "red"
    "Way too high!"
  elsif (guess + 5) < $secret_number
    @color = "red"
    "Way too low!"
  elsif guess < $secret_number
    @color = "rgb(255, 111, 0)"
    "Too low!"
  elsif guess == $secret_number
    @color = "green"
    "You got it right! The secret number is #{$secret_number}"
  elsif guess > $secret_number
    @color = "rgb(255, 111, 0)"
    "Too high!"
  end
end
