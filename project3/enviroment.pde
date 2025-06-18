void drawFloor(int startX, int endX, int startZ, int endZ, int level, int gap) {
  stroke(255);
  strokeWeight(1);

  int tilesX = (endX - startX) / gap;
  int tilesZ = (endZ - startZ) / gap;

  for (int row = 0; row < tilesZ; row++) {
    for (int col = 0; col < tilesX; col++) {
      // Offset every other row by half the gap on X axis
      float x = startX + col * gap + (row % 2) * (gap / 2.0);
      float z = startZ + row * gap;

      // Checkerboard color pattern
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
void drawSkyBackground() {
  skyTimer += 0.0005;
  if (skyTimer > 1) skyTimer = 0;

  // Smooth transition with sine wave
  float t = (sin(TWO_PI * skyTimer - HALF_PI) + 1) / 2;

  color sky = lerpColor(nightColor, dayColor, t);
  background(sky);
}
