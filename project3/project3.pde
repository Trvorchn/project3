
import java.awt.Robot;

boolean wkey, akey, skey, dkey;
float eyeX, eyeY, eyeZ, focusX, focusY, focusZ, tiltX, tiltY, tiltZ;
float leftRightHeadAngle, UpdownHeadAngle;

Robot rbt;
color black = #000000;
color white = #FFFFFF;
color dullBlue = #006F9D; 

boolean skipFrame;


int gridSize;
PImage map;


PImage stone ;
PImage dirtSide, dirtTop, dirtBottom;
PImage diamond;
PImage gravel;
PImage oakSide, oakTop;










void setup() {
  fullScreen(P3D);
  textureMode(NORMAL);
  wkey = akey = skey = dkey = false;

  eyeX = width/2;
  eyeY = 9*height/10.75;
  eyeZ = 0;

  focusX = width/2;
  focusY = height/2;
  focusZ = 10;

  tiltX = 0;
  tiltY = 1;
  tiltZ = 0;


  diamond = loadImage ("Diamond.png");
  dirtSide = loadImage ("dirtSide.png");
  dirtTop = loadImage ("dirtTop.png");
  dirtBottom = loadImage ("dirtBottom.png");
  oakSide = loadImage ("oakSide.png");
  oakTop = loadImage ("oakTop.png");
  gravel = loadImage ("gravel.png");
  stone = loadImage ("stone.png");












  leftRightHeadAngle =radians(270);
  noCursor();

  try {
    rbt = new Robot();
  }
  catch (Exception e) {
    e.printStackTrace();
  }

  map = loadImage("map.png");
  gridSize = 100;
  skipFrame = false;
}
void draw() {
  background(0);

  pointLight(255, 255, 255, eyeX, eyeY, eyeZ);
  drawFloor(-2000, 2000, height, gridSize);
  drawFloor(-2000, 2000, height-gridSize*4, gridSize);
  controlCamera();
  drawFocalPoint();
  drawMap();
}

void drawFloor(int start, int end, int level, int gap) {

  stroke(255);
  strokeWeight(1);
  int x = start;
  int z = start;
  while (z<end) {
    texturedCube(x, level, z, oakTop, gap);
    x = x + gap;

    if (x >= end) {
      x = start;
      z = z + gap;
    }
  }
}

void controlCamera() {



  if (wkey && canMoveForward()) {
    eyeX = eyeX +  cos(leftRightHeadAngle)*10;
    eyeZ = eyeZ + sin(leftRightHeadAngle)*10;
    ;
  }
  if (skey) {
    eyeX = eyeX -  cos(leftRightHeadAngle)*10;
    eyeZ = eyeZ-  sin(leftRightHeadAngle)*10;
    
  }
  if (akey && canMoveLeft()) {
    eyeX = eyeX -  cos(leftRightHeadAngle+PI/2)*10;
    eyeZ = eyeZ  -  sin(leftRightHeadAngle+PI/2)*10;
  }
  if (dkey && canMoveRight()) {
    eyeX = eyeX -  cos(leftRightHeadAngle-PI/2)*10;
    eyeZ = eyeZ -  sin(leftRightHeadAngle-PI/2)*10;
    ;
  }


  leftRightHeadAngle = leftRightHeadAngle + (mouseX - pmouseX)*0.000000000001;
  UpdownHeadAngle = UpdownHeadAngle + (mouseY -pmouseY)*0.00000000000001;


  if (UpdownHeadAngle> PI/2.5) UpdownHeadAngle = PI/2.5;
  if (UpdownHeadAngle> -PI/2.5) UpdownHeadAngle = -PI/2.5;

  focusX = eyeX+ cos(leftRightHeadAngle)*300;
  focusZ = eyeZ+ sin(leftRightHeadAngle)*300;
  focusY = eyeY + tan(UpdownHeadAngle)*300;

  camera(eyeX, eyeY, eyeZ, focusX, focusY, focusZ, tiltX, tiltY, tiltZ);

  if (mouseX > width-2) {
    rbt.mouseMove (3, mouseY);
    skipFrame = true;
  } else if (mouseX < 2) {
    rbt.mouseMove(width-2, mouseY);
    skipFrame = true;
  } else {
    skipFrame = false;
  }

  if (skipFrame == false) {
    leftRightHeadAngle = leftRightHeadAngle + (mouseX - pmouseX)*0.01;
    UpdownHeadAngle = UpdownHeadAngle + (mouseY - pmouseY)*0.01;
  }
}


boolean canMoveForward() {

  float fwdx, fwdy, fwdz;
  int mapx, mapy;


  fwdx = eyeX+ cos(leftRightHeadAngle)*200;
  fwdz = eyeZ+ sin(leftRightHeadAngle)*200;
  fwdy = eyeY;

  mapx = int(fwdx+2000)/gridSize;
  mapy = int(fwdz+2000)/gridSize;

  if (map.get(mapx, mapy) == white) {
    return true;
  } else {
    return false;
  }
}


boolean canMoveLeft() {

  float fwdx, fwdy, fwdz;
  int mapx, mapy;


  fwdx = eyeX+ cos(leftRightHeadAngle-90)*200;
  fwdz = eyeZ+ sin(leftRightHeadAngle-90)*200;
  fwdy = eyeY;

  mapx = int(fwdx+2000)/gridSize;
  mapy = int(fwdz+2000)/gridSize;

  if (map.get(mapx, mapy) == white) {
    return true;
  } else {
    return false;
  }
}
boolean canMoveRight() {

  float fwdx, fwdy, fwdz;
  int mapx, mapy;


  fwdx = eyeX+ cos(leftRightHeadAngle+90)*200;
  fwdz = eyeZ+ sin(leftRightHeadAngle+90)*200;
  fwdy = eyeY;

  mapx = int(fwdx+2000)/gridSize;
  mapy = int(fwdz+2000)/gridSize;

  if (map.get(mapx, mapy) == white) {
    return true;
  } else {
    return false;
  }
}
boolean canMoveBack() {

  float fwdx, fwdy, fwdz;
  int mapx, mapy;


  fwdx = eyeX+ cos(leftRightHeadAngle)*200;
  fwdz = eyeZ+ sin(leftRightHeadAngle)*200;
  fwdy = eyeY;

  mapx = int(fwdx+2000)/gridSize;
  mapy = int(fwdz+2000)/gridSize;

  if (map.get(mapx, mapy) == white) {
    return true;
  } else {
    return false;
  }
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
      if (c==black) {
        texturedCube(x*gridSize-2000, height-gridSize, y*gridSize-2000, stone, gridSize);
        texturedCube(x*gridSize-2000, height-gridSize*2, y*gridSize-2000, stone, gridSize);
        texturedCube(x*gridSize-2000, height-gridSize*3, y*gridSize-2000, stone, gridSize);
      }
      if (c == dullBlue) {

        texturedCube(x*gridSize-2000, height-gridSize, y*gridSize-2000, oakSide, gridSize);
        texturedCube(x*gridSize-2000, height-gridSize*2, y*gridSize-2000, oakSide, gridSize);
        texturedCube(x*gridSize-2000, height-gridSize*3, y*gridSize-2000, oakSide, gridSize);
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
