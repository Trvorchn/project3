
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

PImage bgImage;

color bottomColor = color(255, 214, 165);  // soft warm orange
color topColor = color(166, 200, 255);     // light blue sky

void setup() {
  fullScreen(P3D);
  textureMode(NORMAL);

  bgImage = loadImage("palais.jpg");
  //bgImage.resize(400, 400);

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



  leftRightHeadAngle =radians(360);
  noCursor();

  try {
    rbt = new Robot();
  }
  catch (Exception e) {
    e.printStackTrace();
  }

  map = loadImage("map.png");
  gridSize = 200;
  skipFrame = false;
}
void draw() {
  // 1) Draw background gradient in screen space (disable depth test)
  hint(DISABLE_DEPTH_TEST);
  noLights();
  noStroke();
  for (int y = 0; y < height; y++) {
    float amt = map(y, 0, height, 0, 1);
    fill(lerpColor(bottomColor, topColor, amt));
    rect(0, y, width, 1);
  }
  hint(ENABLE_DEPTH_TEST);

  // 2) Setup your 3D camera AFTER drawing the background
  camera(eyeX, eyeY, eyeZ, focusX, focusY, focusZ, tiltX, tiltY, tiltZ);

  // 3) Enable lights for 3D objects
  pointLight(255, 255, 255, eyeX, eyeY, eyeZ);

  // 4) Draw your floor and objects here
  drawFloor(-2000, 2000, height, gridSize);
  drawFocalPoint();

  int i = 0;
  while (i < objects.size()) {
    GameObject obj = objects.get(i);
    obj.act();
    obj.show();
    if (obj.lives == 0) {
      objects.remove(i);
    } else {
      i++;
    }
  }

  // 5) Update camera control at end of draw
  controlCamera();
}
