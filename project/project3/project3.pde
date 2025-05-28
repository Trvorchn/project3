boolean wkey, akey, skey, dkey;

float eyeX, eyeY, eyeZ, focusX, focusY, focusZ, tiltX, tiltY, tiltZ;
  void setup() {
  size(800, 600, P3D);
  textureMode(NORMAL);
  wkey = akey = skey = dkey = false;
  
  eyeX = width/2;
  eyeY = height/2;
  eyeZ = 0;
  
  focusX = width/2;
  focusY = height/2;
  focusZ = 10;
  
  tiltX = 0;
  tiltY = 1;
  tiltZ = 0;
  
  
}
void draw() {
  background(0);
  drawFloor();
  controlCamera();
}

void drawFloor() {

  stroke(255);
  for (int x = -2000; x <= 2000; x = x + 100) {
    line(x, height, -2000, x, height, 2000);
    line(-2000, height, x, 2000, height, x);
  }
}

void controlCamera() {
  camera(eyeX, eyeY, eyeZ, focusX, focusY, focusZ, tiltX, tiltY, tiltZ);
if (wkey) eyeZ = eyeZ + 10;
if (skey) eyeZ = eyeZ - 10;
if (akey) eyeX = eyeX + 10;
if (dkey) eyeX = eyeX - 10;
focusX = eyeX;
focusY = eyeY;
focusZ = eyeZ+ 10;
}


void keyPressed() {

  if (keyCode == 'W'||keyCode == 'w') wkey = true;
  if (keyCode == 'S'||keyCode == 's') skey = true;
  if (keyCode == 'A'||keyCode == 'a') akey = true;
  if (keyCode == 'D'||keyCode == 'd') dkey = true;
}

void keyReleased() {

  if (keyCode == 'W'||keyCode == 'w') wkey = false;
  if (keyCode == 'S'||keyCode == 's') skey = false;
  if (keyCode == 'A'||keyCode == 'a') akey =false;
  if (keyCode == 'D'||keyCode == 'd') dkey = false;
}
