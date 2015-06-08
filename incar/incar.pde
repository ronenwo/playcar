import processing.video.*;

Movie myMovie;

PGraphics pg;
PImage  imgLast;
boolean mouseClicked = false;

void setup() {

  size(1200, 1000);
  
  myMovie = new Movie(this, "car1.mp4");
  myMovie.loop();
  imgLast = createImage(myMovie.width,myMovie.height,RGB);
  frameRate(30);
  pg = createGraphics(200, 500);  
}


void draw() {
  
//  background(255,255);
//  fill(0);
//  
//  text("sajdklajslk",100,100);
 
//  myMovie.frameRate(30);  

  image(myMovie, 0, 0);
  if (mouseClicked){
    image(pg,mouseX,mouseY);
  }
}


void movieEvent(Movie movie) {
  myMovie.read();
}


void mousePressed() {
   myMovie.pause();
   imgLast = createImage(200,500,RGB);
   imgLast.copy(myMovie,mouseX-100,mouseY-100,200,500,0,0,200,500); // Before we read the new frame, we always save the previous frame for comparison!
   imgLast.updatePixels();
   pg.beginDraw();
    pg.background(255,0);
//  pg.noFill();
//  pg.stroke(255);
//  pg.ellipse(mouseX-120, mouseY-60, 60, 60);
   pg.image(imgLast,0,0); 
   pg.endDraw();
   image(pg,mouseX,mouseY);
   mouseClicked = true;
}


void mouseDragged(){
   image(pg,mouseX,mouseY);    
}  

void mouseReleased() {
     mouseClicked = false;
   myMovie.play();
}

