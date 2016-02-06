#routing rules
Rack::Builder.new do
  map("/"){ run IndexController}
end
