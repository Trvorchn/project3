void firework() {
  if (fireworks == null) fireworks = new ArrayList<Particle>();


  PVector center = new PVector(
    eyeX + random(-500, 500),    
    eyeY + 4000 + random(200, 400), 
    eyeZ + random(-500, 500)
  );

  for (int i = 0; i < 200; i++) {
    Particle p = new Particle(center);
    p.vel = PVector.random3D();
    p.vel.mult(random(4, 12));
    p.gravity = new PVector(0, 0.08, 0);
    p.size = 4;
    p.lives = 255;
    fireworks.add(p);
  }
}
