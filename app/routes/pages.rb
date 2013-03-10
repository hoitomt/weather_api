class GuineaPig < Sinatra::Application
  get '/' do
    slim :'pages/index', :layout => :'layout/application'
  end

  get '/README/?' do
    markdown File.read("#{Dir.pwd}/README.md")
  end
end