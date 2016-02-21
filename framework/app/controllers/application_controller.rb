class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  # set folder for templates to ../views, but make the path absolute
  set :views, Proc.new { File.join( root ,'../views')}
  #set :public_folder, Proc.new { File.join(root, "../../public") } 
  set :method_override, true
  set :sessions, true

	def herb(template, options={}, locals={})
		render "html.erb", template, options, locals
	end
	not_found do
    herb :not_found
  end
end
