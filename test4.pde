import netP5.*;
import oscP5.*;

OscP5 osc5;
NetAddress supercollider;

float position_x = 100;
float position_y = 100;
float size = 200;

void setup() {
  size(500,500);
  frameRate(10);
  //OscProperties osc_properties = new OscProperties();
  // osc_properties.setListeningPort(47120);
  osc5 = new OscP5(this, 12000);
  supercollider = new NetAddress("127.0.0.1",57121);
}

void mouseClicked() {
  position_x = mouseX;
  position_y = mouseY;
  
  float freq = position_x + 500;
  float amp = position_y / 500;
  
  OscMessage msg = new OscMessage("/blip/play");
  msg.add(freq);
  msg.add(amp);
  
  osc5.send(msg, supercollider);
}

void draw() {
  background(255);
  fill(255,120,0);
  rect(position_x,position_y,100,100);
}
