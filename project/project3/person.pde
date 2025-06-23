class Person extends GameObject {
  PImage img;
  float speedX, speedZ;

  Person(float x, float y, float z, PImage img) {
    super(x, y, z, 300); // increase size to 300
    this.img = img;
    this.speedX = random(-1, 3);
    this.speedZ = random(-1, 3);
  }

  void act() {
    float newX = loc.x + speedX;
    float newZ = loc.z + speedZ;
    int mapX = int((newX + 2000) / gridSize);
    int mapZ = int((newZ + 2000) / gridSize);
    if (mapX >= 0 && mapX < map.width && mapZ >= 0 && mapZ < map.height) {
      color c = map.get(mapX, mapZ);
      if (c == white) {
        loc.x = newX;
        loc.z = newZ;
      } else {
        speedX = random(-1, 1);
        speedZ = random(-1, 1);
      }
    }
  }

  void show() {
    if (img == null) return;

    pushMatrix();
    translate(loc.x, loc.y, loc.z);

    float angle = frameCount * 0.01;
    rotateY(angle);
    scale(1); // Flip vertically

    noLights();
    tint(255);
    beginShape();
    texture(img);
    float halfSize = size / 2.0;
    vertex(-halfSize, size, 0, 0, 1);   // bottom left
    vertex(halfSize, size, 0, 1, 1);    // bottom right
    vertex(halfSize, 0, 0, 1, 0);       // top right
    vertex(-halfSize, 0, 0, 0, 0);      // top left
    endShape(CLOSE);

    popMatrix();
  }
}
