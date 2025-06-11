
import java.awt.Robot;

boolean wkey, akey, skey, dkey;
float eyeX, eyeY, eyeZ, focusX, focusY, focusZ, tiltX, tiltY, tiltZ;
float leftRightHeadAngle, upDownHeadAngle;

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

ArrayList <GameObject> objects;




void setup() {
  fullScreen(P3D);
  textureMode(NORMAL);

  objects = new ArrayList<GameObject>();

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

if (key == ' ') { 
  objects.add(new Bullet());
}

  pointLight(255, 255, 255, eyeX, eyeY, eyeZ);
  drawFloor(-2000, 2000, height, gridSize);
  drawFloor(-2000, 2000, height-gridSize*4, gridSize);
  controlCamera();
  drawFocalPoint();
  drawMap();

  int i = 0;
  while ( i < objects.size()) {
    GameObject obj = objects.get(i);
    obj.act();
    obj.show();
    if (obj.lives == 0) {
      objects.remove(i);
    } else {
      i++;
    }
  }
}
