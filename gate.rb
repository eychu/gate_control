require 'sinatra'
require 'serialport'

configure do
  device = Dir.entries("/dev").select{|i| i =~ /ttyACM|ttyUSB/ }.first
#  $serial_port = SerialPort.new("/dev/#{device}", 9600, 8, 1, SerialPort::NONE)
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
    <meta charset="utf-8">
    <title>Управление воротами</title>
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <link href="ratchet.min.css" rel="stylesheet">
  </head>
  <body>
    <header class="bar bar-nav">
      <h1 class="title">Управление воротами</h1>
    </header>
    <div class="content">
      <div class="content-padded">
        <h5>Описание работы:</h5>
        <p>Ворота могут находиться в двух состояниях: closed, opened. Переход между состояниями происходит по клику.
           Во время этого перехода мигает лампочка. Если нажать на кнопку при мигающей лампочке, ворота остановятся и
           переход будет считаться завершенным, лампочка погаснет. Tакже переход будет считаться завершенным при полном
           открытии-закрытии ворот и погасании лампочки. При следующем клике начнется переход в противоположное состояние. 
        </p>
        <p>
           Соответственно, "Одинарная комманда" используется для начала действия, например, для открытия ворот, 
           затем "Двойная комманда" - для завершения открытия и начала закрытия ворот
        </p>
	<h6>Убедительная просьба с воротами просто так не играть!</h6>
	<form action="/open" method="post">
	  <input type="submit" value="Одинарная комманда" class="btn btn-primary btn-block" />
	</form>
	<form action="/close" method="post">
	  <input type="submit" value="Двойная комманда" class="btn btn-positive btn-block"/>
	</form>
      </div>
    </div>
  </body>
</html>

