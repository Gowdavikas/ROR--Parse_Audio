Rails.application.routes.draw do

  post '/transcripts', to: 'transcripts#create'
  get '/transcript/:id', to: 'transcripts#show'


end
