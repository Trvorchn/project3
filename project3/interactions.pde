
void keyPressed() {

  if (keyCode == 'W'||keyCode == 'w') wkey = true;
  if (keyCode == 'S'||keyCode == 's') skey = true;
  if (keyCode == 'A'||keyCode == 'a') akey = true;
  if (keyCode == 'D'||keyCode == 'd') dkey = true;
}

void keyReleased() {

  if (keyCode == 'W'||keyCode == 'w') wkey = false;
  if (keyCode == 'S'||keyCode == 's') skey = false;
  if (keyCode == 'A'||keyCode == 'a') akey =false;
  if (keyCode == 'D'||keyCode == 'd') dkey = false;
}
