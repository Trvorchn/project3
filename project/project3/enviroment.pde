void drawFloor(int start, int end, int level, int gap) {

  stroke(255);
  strokeWeight(1);
  int x = start;
  int z = start;
  while (z<end) {
    texturedCube(x, level, z, dirtTop, gap);
    x = x + gap;

    if (x >= end) {
      x = start;
      z = z + gap;
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
