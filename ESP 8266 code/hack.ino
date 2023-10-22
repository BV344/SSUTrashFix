
#include <ESP8266WiFi.h>
#include <FirebaseArduino.h>
#include <String>

// Change the SSID and password for the wifi login
#define WIFI_SSID "Galaxy S23+ 67AF" 
#define WIFI_PASSWORD "Upallnight1234"

using namespace std;
// Declaration and initialization of the input pin
const int trigger = 14;
const int reset   = 10;

void setup ()
{
  // sets the input pins for the sensors
 pinMode(trigger, INPUT);
 pinMode(reset, INPUT);
 Serial.begin (9600); // Serial output with 9600 bps
   // connect to wifi.
  WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
  Serial.print("connecting");
  while (WiFi.status() != WL_CONNECTED) {
    Serial.print(".");
    delay(500);
  }
  Serial.println();
  Serial.print("connected: ");
  Serial.println(WiFi.localIP());
  
  // change for appopriate host and auth to login
  String FIREBASE_HOST = "trashfix-e3b6f-default-rtdb.firebaseio.com";
  String FIREBASE_AUTH = "MniAInLbt72ctRhJGlgjbQD1bKWO7la8psJaVAWG";

  Firebase.begin(FIREBASE_HOST, FIREBASE_AUTH);
  if (Firebase.failed()) {
      Serial.print("setting /firebase failed:");
      Serial.println(Firebase.error());  
      return;
  }
}
// The program reads the current value of the input pins

void loop ()
{
  if(!digitalRead(trigger)){
    Firebase.setString("Status","Full");
    while(digitalRead(reset)){
      yield();
    }
    if(digitalRead(reset)){
      while(digitalRead(reset)){
        yield();
      }
    }
  }
  else{
    Firebase.setString("Status","Good");
    while(digitalRead(trigger)){
      yield();
    }
  }
}