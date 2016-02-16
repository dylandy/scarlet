#routing rules
Rack::Builder.new do
  YAML.load_file("./config/routes.yml").each_pair do |key , value|
    map(key){run value}
  end
end
