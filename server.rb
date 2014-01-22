require 'sinatra'
require 'haml'
require 'base64'
require 'net/http'
require 'uri'
require 'sinatra/assetpack'
require 'bourbon'

set :bind, '0.0.0.0'


set :root, File.dirname(__FILE__) # You must set app root

#  register Sinatra::AssetPack

assets {
	serve '/js',     from: 'assets/js'        # Default
	serve '/css',    from: 'assets/css'       # Default
	
	js :widget,  [
      '/js/widget.coffee'
	]

	css :widget_style,  [
	  '/css/widget_style.css'
	]

	js_compression  :yui, :munge => true     # :jsmin | :yui | :closure | :uglify
	css_compression :yui   # :simple | :sass | :yui | :sqwish
}



get '/' do
	haml :home
end

get '/widget' do 


end

get '/news' do
	@height = params[:height] || "300px"
	@width = params[:width] || "200px"
	@locale = params[:locale] || "en"
	@location = params[:location] || "italy"
	haml :news
end


