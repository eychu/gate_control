int relayPin = 9;
int sendTime = 800;
int delayTime = 5000;

unsigned long changeTime = delayTime;

void setup()
{
  Serial.begin(9600);
  pinMode(relayPin, OUTPUT);
}

void gatePing()
{
  digitalWrite(relayPin, HIGH);
  delay(sendTime);  
  digitalWrite(relayPin, LOW);
  delay(sendTime);  
} 

void loop()
{
  if ( Serial.available() && (millis() - changeTime > delayTime) )  {
    changeTime = millis();
    char command = Serial.read();
    switch (command) {
      case 'o':
        gatePing();
        break;
      case 'c':
        gatePing(); 
        gatePing();
        break;
    }
  }
  while(Serial.available()) Serial.read();
}
