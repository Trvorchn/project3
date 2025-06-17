class Cloud {
  float x, y, z;
  float speed;
  float size;

  Cloud() {
    x = random(-5000, 5000);
    z = random(-5000, 5000);
    y = random(-800, -300);  // high in sky
    speed = random(0.2, 0.5);
    size = random(200, 400);
  }

  void update() {
    x += speed;
    if (x > 5000) x = -5000;
  }

  void show() {
    pushMatrix();
    translate(x, y, z);
    rotateX(HALF_PI); // rotate to face downwards
    tint(255, 150);   // semi-transparent
    imageMode(CENTER);
    image(cloudTexture, 0, 0, size, size);
    popMatrix();
  }
}
