boolean wkey, akey, skey, dkey;
float eyeX, eyeY, eyeZ, focusX, focusY, focusZ, tiltX, tiltY, tiltZ;
float leftRightHeadAngle, UpdownHeadAngle;






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

  leftRightHeadAngle = radians(270);
  noCursor();
}
void draw() {
  background(0);

  drawFloor();
  controlCamera();
  drawFocalPoint();
  //println(focusX, focusZ);
}

void drawFloor() {

  stroke(255);
  for (int x = -2000; x <= 2000; x = x + 100) {
    line(x, height, -2000, x, height, 2000);
    line(-2000, height, x, 2000, height, x);
  }
}

void controlCamera() {


  
  if (wkey){
    eyeX = eyeX +  cos(leftRightHeadAngle)*10;
  eyeZ = eyeZ + sin(leftRightHeadAngle)*10;;
  
  }
  if (skey){ 
   eyeX = eyeX -  cos(leftRightHeadAngle)*10;
  eyeZ = eyeZ-  sin(leftRightHeadAngle)*10;;
}
  if (akey){
   eyeX = eyeX -  cos(leftRightHeadAngle+PI/2)*10;
  eyeZ = eyeZ  -  sin(leftRightHeadAngle+PI/2)*10;
  }
  if (dkey){ 
   eyeX = eyeX -  cos(leftRightHeadAngle-PI/2)*10;
  eyeZ = eyeZ -  sin(leftRightHeadAngle-PI/2)*10;;
  }
  
  
  leftRightHeadAngle = leftRightHeadAngle + (mouseX - pmouseX)*0.01;
  UpdownHeadAngle = UpdownHeadAngle + (mouseY -pmouseY)*0.01;


  if (UpdownHeadAngle> PI/2.5) UpdownHeadAngle = PI/2.5;
  if (UpdownHeadAngle> -PI/2.5) UpdownHeadAngle = -PI/2.5;

  focusX = eyeX+ cos(leftRightHeadAngle)*300;
  focusZ = eyeZ+ sin(leftRightHeadAngle)*300;
  focusY = eyeY + tan(UpdownHeadAngle)*300;
  
  camera(eyeX, eyeY, eyeZ, focusX, focusY, focusZ, tiltX, tiltY, tiltZ);
}
void drawFocalPoint() {
  pushMatrix();
  translate(focusX, focusY, focusZ);
  sphere(5);
  popMatrix();
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
