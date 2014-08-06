Управление воротами
======

Eсли не хватает прав на использование порта под линухой:

The issue with the permissions for /dev/ttyACM0 can be permanantly solved by adding yourself to the dialout group. You will have to logout and then log back in before the group change is recognized.
```
sudo usermod -a -G dialout <username>
```


Запуск сервера:
```
rvmsudo rackup
```

TODO
----
- сделать атоматическое нахождение необходимого девайса, а то при подключении в другой порт, может измениться идентификатор
