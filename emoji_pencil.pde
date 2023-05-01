PImage emoji;
float emoji_size = 160;

void setup() {
  size(1920, 1080);
  emoji = loadImage("money.png");
  emoji_size = 80;
  background(247);
}

void draw() {
  if (mousePressed) {
    image(emoji, mouseX-emoji_size*0.5, mouseY-emoji_size*0.5, emoji_size, emoji_size);
  }
}
