
import java.awt.Robot;

boolean wkey, akey, skey, dkey;
float eyeX, eyeY, eyeZ, focusX, focusY, focusZ, tiltX, tiltY, tiltZ;
float leftRightHeadAngle, UpdownHeadAngle;

Robot rbt;
color black = #000000;
color white = #FFFFFF;




int gridSize;
PImage map;



void setup() {
  fullScreen(P3D);
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

  try {
    rbt = new Robot();
  }
  catch (Exception e) {
    e.printStackTrace();
  }

  map = loadImage("map.png");
  gridSize = 100;
}
void draw() {
  background(0);

  drawFloor();
  controlCamera();
  drawFocalPoint();
  drawMap();
  
}

void drawFloor() {

  stroke(255);
  for (int x = -2000; x <= 2000; x = x + 100) {
    line(x, height, -2000, x, height, 2000);
    line(-2000, height, x, 2000, height, x);
  }
}

void controlCamera() {



  if (wkey) {
    eyeX = eyeX +  cos(leftRightHeadAngle)*10;
    eyeZ = eyeZ + sin(leftRightHeadAngle)*10;
    ;
  }
  if (skey) {
    eyeX = eyeX -  cos(leftRightHeadAngle)*10;
    eyeZ = eyeZ-  sin(leftRightHeadAngle)*10;
    ;
  }
  if (akey) {
    eyeX = eyeX -  cos(leftRightHeadAngle+PI/2)*10;
    eyeZ = eyeZ  -  sin(leftRightHeadAngle+PI/2)*10;
  }
  if (dkey) {
    eyeX = eyeX -  cos(leftRightHeadAngle-PI/2)*10;
    eyeZ = eyeZ -  sin(leftRightHeadAngle-PI/2)*10;
    ;
  }


  leftRightHeadAngle = leftRightHeadAngle + (mouseX - pmouseX)*0.004;
  UpdownHeadAngle = UpdownHeadAngle + (mouseY -pmouseY)*0.004;


  if (UpdownHeadAngle> PI/2.5) UpdownHeadAngle = PI/2.5;
  if (UpdownHeadAngle> -PI/2.5) UpdownHeadAngle = -PI/2.5;

  focusX = eyeX+ cos(leftRightHeadAngle)*300;
  focusZ = eyeZ+ sin(leftRightHeadAngle)*300;
  focusY = eyeY + tan(UpdownHeadAngle)*300;

  camera(eyeX, eyeY, eyeZ, focusX, focusY, focusZ, tiltX, tiltY, tiltZ);

  if (mouseX > width-2) rbt.mouseMove (2, mouseY);
  else if (mouseX < 2) rbt.mouseMove(width-2, mouseY);
}
void drawFocalPoint() {
  pushMatrix();
  translate(focusX, focusY, focusZ);
  sphere(5);
  popMatrix();
}

void drawMap() {
  for (int x = 0; x < map.width; x++) {
    for ( int y = 0; y < map.height; y++) {
      color c = map.get(x, y);
      if (c!=white) {
        pushMatrix();
        fill(c);
        stroke(100);
        translate(x*gridSize-2000, height/2, y*gridSize-2000);
        box(gridSize, height, gridSize);
        popMatrix();
      }
    }
  }
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
