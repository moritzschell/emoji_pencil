/*
code by moritz schell (moritzschell.de)
feel free to use and adapt to your needs

Manual:
press mouse to draw,
press 's' to save image
press SPACE to clear all
press 'a', 'b', 'f' or 'm' to change pencil:
"artist", "brain", "fire", "money"
*/

//Variable for image. In this case an emoji (could be any image loaded to data folder of processing sketch)
PImage emoji;
PImage cursor_image;

//size of pencil-tip
float emoji_size = 160;
      
//variables to clean background and save image
boolean cleanBackground = false;
boolean saveImage = false;

//variables to give saved images a meaningful name
String imgName = "Money";
int saveCount = 0;


void setup() {
  //set size
  size(1920, 1080);
  pixelDensity(2); //for high-res monitors
  
  //load image from data folder and store in variable
  emoji = loadImage("fire.png");
  //image to change appearence of cursor
  cursor_image = loadImage("dot.png");
  emoji_size = 80;
  background(247);
  cursor(cursor_image);
}

void draw() {
  //only clean once, when SPACE is pressed (see keyPressed fuction)
  if (cleanBackground == true) {
    background(247);
    cleanBackground = false; // set cleanBackgrond variable immediately back to false
  }

  cursor(cursor_image);
  if (mousePressed == true) {
    noCursor();
    //when mouse is pressed: draw images...
    image(emoji, mouseX-emoji_size*0.5, mouseY-emoji_size*0.5, emoji_size, emoji_size);
  }

  if (saveImage == true) {
    save("images/"+saveCount+"_"+imgName+".jpg");
    saveCount++;
    saveImage = false;
  }
}

// Use keys to switch images (press a for "artist" emoji, press b for "brain" emoji, ...)
void keyPressed() {
  if (key == 'a') {
    emoji = loadImage("artist.png");
    imgName = "Artist";
  }
  if (key == 'b') {
    emoji = loadImage("brain.png");
    imgName = "Brain";
  }
  if (key == 'f') {
    emoji = loadImage("fire.png");
    imgName = "Fire";
  }
  if (key == 'm') {
    emoji = loadImage("money.png");
    imgName = "Money";
  }
  if (key == 's') {
    saveImage = true;
  }
  if (key == ' ') {
    cleanBackground = true;
  }
}
