require 'yahoo_weatherman'

#User enters Zip Code
puts "Please enter your Zip Code: (i.e 200011)"
user_location = gets.chomp

#Method that accepts the location as a parameter then
#uses the weathger gem of choice to determine the weather
def get_user_location(user_location)
    client = Weatherman::Client.new
    client.lookup_by_location(user_location)
end

weather = get_user_location(user_location)

today = Time.now.strftime('%w').to_i

weather.forecasts.each do |forecast|

day = forecast['date']
    
#Shows user forecast for today and tomorrow

weekday = day.strftime('%w').to_i
    
    if weekday == today 
        dayName = 'Today'
    elsif weekday == today + 1
        dayName = 'Tomorrow'
    else 
        dayName = day.strftime('%A')
    end
    
#Converts temperature from celcius to fahrenheit
    temp_low = (forecast['low'] * 1.8) + 32
    temp_high = (forecast['high'] * 1.8) + 32
 
    puts dayName + ' is going to be ' + forecast['text'].downcase + ' with a low of ' + temp_low.to_s + ' F and a high of ' + temp_high.to_s + ' F'
end