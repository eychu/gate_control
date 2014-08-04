#\ -p 88
require './gate.rb'

set :environment, :production
set :bind, '192.168.1.46'

run Sinatra::Application
