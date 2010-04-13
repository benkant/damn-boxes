float eyeX, eyeY, eyeZ;
float centerX, centerY, centerZ;
float upX, upY, upZ;

PFont font;

void setup() {
  size(800, 600, P3D);
  
  font = loadFont("CourierNew36.vlw");
  textFont(font);
  
  eyeX = width/2.0;
  eyeY = height/2.0;
  eyeZ = (height/2.0) / tan(PI*60.0 / 360.0);
  centerX = width/2.0;
  centerY = height/2.0;
  centerZ = 0;
  upX = 0.0;
  upY = 1.0;
  upZ = 0.0;
}

void draw() {
  update();
  render();
}

void update() {
  eyeX = mouseX;
  eyeY = mouseY;
  
}

void render() {
  background(0, 0, 0);

  camera();

  printMouseToSketch();
  printCameraToSketch();
  
  camera(eyeX, eyeY, eyeZ, centerX, centerY, centerZ, upX, upY, upZ);
  
  pushMatrix();
  translate(width/2, height/2, 0);
  noStroke();
  fill(0, 50, 100);
  ambientLight(100, 100, 100);
  lightSpecular(200, 200, 200);
  directionalLight(100, 100, 100, 0, 0, -1);
  specular(255, 255, 255);
  shininess(1.0);
  box(40);
  popMatrix();

}

void printMouseToSketch() {
  fill(255, 0, 0);
  text("Mouse: " + Integer.toString(mouseX) + ", " + Integer.toString(mouseY), 15, 30);
}

void printCameraToSketch() {
  fill(0, 0, 255);
  text("Eye: " + Float.toString(eyeX) + ", " + Float.toString(eyeY) + ", " + Float.toString(eyeZ), 15, height-80);
  text("Centre: " + Float.toString(centerX) + ", " + Float.toString(centerY) + ", " + Float.toString(centerZ), 15, height-50);
  text("Up: " + Float.toString(upX) + ", " + Float.toString(upY) + ", " + Float.toString(upZ), 15, height-20);
}
