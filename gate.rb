require 'sinatra'
require 'serialport'

configure do
  device = Dir.entries("/dev").select{|i| i =~ /ttyACM|ttyUSB/ }.first
  $serial_port = SerialPort.new("/dev/#{device}", 9600, 8, 1, SerialPort::NONE)
end

get '/' do
  erb :index
end

post '/:mode' do
  $mode = params[:mode]
  $serial_port.write($mode[0])
  redirect '/', 302
end

__END__

@@index

<!DOCTYPE html>
<html>
  <head>
    <title>Door controller</title>
  </head>

  <body>
    <form action="/open" method="post">
      <input type="submit" value="one command" style="height:150px; width:100%"/>
    </form>
    <br/>
    <form action="/close" method="post">
      <input type="submit" value="double command" style="height:150px; width:100%"/>
    </form>
  </body>
</html>
