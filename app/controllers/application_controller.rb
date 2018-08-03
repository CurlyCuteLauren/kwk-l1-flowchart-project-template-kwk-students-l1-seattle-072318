require 'sinatra'

class ApplicationController < Sinatra::Base
 configure do
    set :public_folder, 'public'
    set :views, 'app/views'
 end
 
  get '/' do 
     return erb :index
  end 
 
  post '/results' do
    answers = []
    answers << params.values #"value" in index
    @total = 0 #at the beginning of the quiz
    answers.each do |x| #goes to the array of values
      num = 0
      while num < 5
        new_count = x[num].to_i
        @total += new_count #adds up numbers that user chose -- also convert to integer bc we're taking in numbers
        num += 1 
      end
    end
    puts @total

    @combo = cool_generator(@total) 
    if @combo == "bluebeard"
      erb :bluebeard
    elsif @combo == "thirtyfour_array"
      erb :thirtyfour_array
     elsif @combo == "twentyfive_array"
       erb :twentyfive_array
      elsif @combo == "ghost_alley"
      erb :ghost_alley
     elsif @combo == "fortysix_array"
       erb :fortysix_array
     elsif @combo == "jewel_box"
       erb :jewel_box
     elsif @combo == "meowtropolitan"
       erb :meowtropolitan
     elsif @combo == "thirtyfive_array"
       erb :thirtyfive_array
     elsif @combo == "error"
       erb :error
    end
  end
end

