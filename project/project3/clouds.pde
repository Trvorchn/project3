class Cloud {
  float x, y, z;
  float speed;
  float size;

  Cloud() {
    x = random(-5000, 5000);
    z = random(-5000, 5000);
    y = random(-900, -1000);
    speed = random(0.2, 1);
    size = random(200, 800);
  }

  void update() {
    x += speed;
    if (x > 5000) x = -5000;
  }

  void show() {
    pushMatrix();
    translate(x, y, z);
    rotateX(HALF_PI); 
    tint(255); 
    imageMode(CENTER);
    image(cloudTexture, 0, 0, size, size);
    popMatrix();
  }
}
