require 'sinatra'
require 'serialport'

configure do
  $serial_port = SerialPort.new("/dev/ttyACM0", 9600, 8, 1, SerialPort::NONE)
end

get '/' do
  erb :index
end

post '/' do
  $serial_port.write(1)
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
    <form action="/" method="post">
      <input type="submit" value="Change gate state" style="height:150px; width:100%"/>
    </form>
  </body>
</html>
