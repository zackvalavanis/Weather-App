# user can enter a city and program will print out 
# "it is 70 and sunny in san francisco"
# #Make a Ruby script to display the current forecast (temperature min/max, description, wind speed, etc.)
# Some features to add to your weather app:
# Display other weather data (min, max, humidity, etc)
# Ask the user for the name of a city to forecast
# Ask the user for preferred temperature units (Celcius or Farenheit)
# Write the app in a loop (once you show the forecast, the user can keep entering different cities until they choose to quit the program)

require 'Http'
api_key = ENV['MY_API_KEY']

while true 
  p "Enter q to quit the program"
  p "Please enter a city to get the weather."

  location = gets.chomp

  if location.downcase == 'q'
    break
  end

  p "What is your preferred temperature unit: Celsius or Fahrenheit? (Enter 'c' for Celsius, 'f' for Fahrenheit)"

  units_input = gets.chomp.downcase

  if units_input == 'c'
    units = 'metric'
  elsif units_input == "f"
    units = 'imperial'
  else units_input = 'standard'
  end

  response = HTTP.get("https://api.openweathermap.org/data/2.5/weather?q=#{location}&appid=#{api_key}&units=#{units}")

  weather = response.parse

  current_temp = weather['main']['temp']
  temp_min = weather['main']['temp_min']
  temp_max = weather['main']['temp_max']

  p "It is currently #{temp_min} in #{location}. The minimum temperature for the day is #{temp_min} and the maximum temperature for the day is #{temp_max}."

end