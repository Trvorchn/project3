void controlCamera() {
  
  if (wkey && canMoveForward()) {
    eyeX = eyeX +  cos(leftRightHeadAngle)*10;
    eyeZ = eyeZ + sin(leftRightHeadAngle)*10;
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
  }


  leftRightHeadAngle = leftRightHeadAngle + (mouseX - pmouseX)*0.001;
  upDownHeadAngle = upDownHeadAngle + (mouseY -pmouseY)*0.001;


  if (upDownHeadAngle> PI/2.5) upDownHeadAngle = PI/2.5;
  if (upDownHeadAngle> -PI/2.5) upDownHeadAngle = -PI/2.5;

  focusX = eyeX+ cos(leftRightHeadAngle)*300;
  focusZ = eyeZ+ sin(leftRightHeadAngle)*300;
  focusY = eyeY + tan(upDownHeadAngle)*300;

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
    upDownHeadAngle = upDownHeadAngle + (mouseY - pmouseY)*0.01;
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


  fwdx = eyeX+ cos(leftRightHeadAngle+180)*200;
  fwdz = eyeZ+ sin(leftRightHeadAngle+180)*200;
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
  stroke(255, 0, 0);
  sphere(5);
  popMatrix();
}
