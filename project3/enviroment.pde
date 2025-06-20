void drawFloor(int startX, int endX, int startZ, int endZ, int level, int gap) {
  stroke(255);
  strokeWeight(1);

  int tilesX = (endX - startX) / gap;
  int tilesZ = (endZ - startZ) / gap;

  for (int row = 0; row < tilesZ; row++) {
    for (int col = 0; col < tilesX; col++) {
      float x = startX + col * gap + (row % 2) * (gap / 2.0);
      float z = startZ + row * gap;
      PImage tileTexture = ((row + col) % 2 == 0) ? coal : quartz;

      texturedCube(int(x), level, int(z), tileTexture, gap);
    }
  }
}



void drawMap() {
  for (int x = 0; x < map.width; x++) {
    for ( int y = 0; y < map.height; y++) {
      color c = map.get(x, y);
      if (c==black) {
        texturedCube(x*gridSize-2000, height-gridSize, y*gridSize-2000, sandStone, gridSize);
        texturedCube(x*gridSize-2000, height-gridSize*2, y*gridSize-2000, sandStone, gridSize);
        texturedCube(x*gridSize-2000, height-gridSize*3, y*gridSize-2000, sandStone, gridSize);
        texturedCube(x*gridSize-2000, height-gridSize*4, y*gridSize-2000, sandStone, gridSize);
        texturedCube(x*gridSize-2000, height-gridSize*5, y*gridSize-2000, sandStone, gridSize);
        texturedCube(x*gridSize-2000, height-gridSize*6, y*gridSize-2000, sandStone, gridSize);
        texturedCube(x*gridSize-2000, height-gridSize*7, y*gridSize-2000, sandStone, gridSize);
        texturedCube(x*gridSize-2000, height-gridSize*8, y*gridSize-2000, sandStone, gridSize);
        texturedCube(x*gridSize-2000, height-gridSize*9, y*gridSize-2000, sandStone, gridSize);
      }
      if (c == dullBlue) {
        texturedCube(x*gridSize-2000, height-gridSize*3, y*gridSize-2000, sandStone, gridSize);
        texturedCube(x*gridSize-2000, height-gridSize*4, y*gridSize-2000, sandStone, gridSize);
        texturedCube(x*gridSize-2000, height-gridSize*5, y*gridSize-2000, sandStone, gridSize);
        texturedCube(x*gridSize-2000, height-gridSize*6, y*gridSize-2000, sandStone, gridSize);
        texturedCube(x*gridSize-2000, height-gridSize*7, y*gridSize-2000, sandStone, gridSize);
        texturedCube(x*gridSize-2000, height-gridSize*8, y*gridSize-2000, sandStone, gridSize);
        texturedCube(x*gridSize-2000, height-gridSize*9, y*gridSize-2000, sandStone, gridSize);
      }
      if (c == grey) {
        texturedCube(x*gridSize-2000, height-gridSize, y*gridSize-2000, sandStone, gridSize);
        texturedCube(x*gridSize-2000, height-gridSize*9, y*gridSize-2000, sandStone, gridSize);
      }
      if (c == green) {
        texturedCube(x*gridSize-2000, height-gridSize, y*gridSize-2000, leaf, gridSize);
        texturedCube(x*gridSize-2000, height-gridSize*2, y*gridSize-2000, leaf, gridSize);
      }
    }
  }
}


void drawSkyBackground() {

  skyTimer += 0.0005;
  if (skyTimer > 1) skyTimer = 0;

  float t = (sin(TWO_PI * skyTimer - HALF_PI) + 1) / 2;

  float r = red(nightColor) + (red(dayColor) - red(nightColor)) * t;
  float g = green(nightColor) + (green(dayColor) - green(nightColor)) * t;
  float b = blue(nightColor) + (blue(dayColor) - blue(nightColor)) * t;

  background(color(r, g, b));

}
