require 'sinatra/base'
require 'sinatra/flash'
require './lib/hangperson_game.rb'

class HangpersonApp < Sinatra::Base

  enable :sessions
  register Sinatra::Flash
  
  before do
    @game = session[:game] || HangpersonGame.new('')
  end
  
  after do
    session[:game] = @game
  end
  
  get '/' do
    redirect '/new'
  end
  
  get '/new' do
    erb :new
  end
  
  post '/create' do
    word = params[:word] || HangpersonGame.get_random_word

    @game = HangpersonGame.new(word)
    redirect '/show'
  end


  post '/guess' do
    letter = params[:guess].to_s[0]
    begin
      if !@game.guess(letter)
         flash[:message] = "Letter used already, try again."
      end
    rescue ArgumentError => _
      flash[:message] = "Invalid character, only use a-z!"
    end
    redirect '/show'
  end
  
  get '/show' do
    erb :show
  end
  
  get '/win' do
    erb :win
  end
  
  get '/lose' do
    erb :lose
  end
  
end
