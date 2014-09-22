# Homepage (Root path)
get '/' do
  erb :index
end

get '/tracks' do
  #'track List here'
  @tracks = Track.all
  erb :'tracks/index'
end

get '/tracks/new' do
  @track = Track.new
  erb :'tracks/new'
end

get '/tracks/:author' do
  @tracks = Track.where( :author => params[:author] )
  @author = params[:author]
  erb :'tracks/other'
end

get '/tracks/:id' do
  @track = Track.find params[:id]
  erb :'tracks/show'
end

#binding.pry

post '/tracks' do
  @track = Track.new(
    # title: params[:title],
    author: params[:author],
    link: params[:link],
    artist: params[:artist],
    title: params[:title]  
    )
  if @track.save
    redirect '/tracks'
  else
    erb :'tracks/new'
  end
end