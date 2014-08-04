int relayPin = 9;
int sendTime = 800;
int delayTime = 5000;

unsigned long changeTime = delayTime;

void setup()
{
  Serial.begin(9600);
  pinMode(relayPin, OUTPUT);
}

void loop()
{
  if ( Serial.available() && (millis() - changeTime > delayTime) )  {
    changeTime = millis();
    digitalWrite(relayPin, HIGH);
    delay(sendTime); // send long
    digitalWrite(relayPin, LOW);
  } 
  Serial.read();
}

