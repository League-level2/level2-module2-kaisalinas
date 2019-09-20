//*
// ***** SEGMENT CLASS *****
// This class will be used to represent each part of the moving snake.
//*

class Segment {

  //Add x and y member variables. They will hold the corner location of each segment of the snake.
  int x = 200;
  int y = 200;

  // Add a constructor with parameters to initialize each variable.
  Segment(int x, int y) {
    this.x = x;
    this.y = y;
  }
}


//*
// ***** GAME VARIABLES *****
// All the game variables that will be shared by the game methods are here
//*
Segment head;
int foodx;
int foody;
int direction = UP;
int food = 0;
ArrayList<Segment> tail = new ArrayList<Segment>();


//*
// ***** SETUP METHODS *****
// These methods are called at the start of the game.
//*

void setup() {
  size(500, 500);
  head = new Segment(250, 250);
  frameRate(20);
  dropFood();
  noStroke();
}

void dropFood() {
  //Set the food in a new random location
  foodx = ((int)random(50)*10);
  foody = ((int)random(50)*10);
}



//*
// ***** DRAW METHODS *****
// These methods are used to draw the snake and its food 
//*

void draw() {
  background(10, 80, 100);
  drawFood();
  move();
  drawSnake();
}

void drawFood() {
  //Draw the food
  fill(0, 255, 0);
  square(foodx, foody, 10);
}

void drawSnake() {
  //Draw the head of the snake followed by its tail
  fill(255, 0, 0);
  square(head.x, head.y, 10);
}


//*
// ***** TAIL MANAGEMENT METHODS *****
// These methods make sure the tail is the correct length.
//*

void drawTail() {
  //Draw each segment of the tail
for(Segment seg: tail){
rect(seg.x,seg.y, 10, 10);
}
}

void manageTail() {
  //After drawing the tail, add a new segment at the "start" of the tail and remove the one at the "end" 
  //This produces the illusion of the snake tail moving.
checkTailCollision();
drawTail();

}
void checkTailCollision() {
  //If the snake crosses its own tail, shrink the tail back to one segment
}



//*
// ***** CONTROL METHODS *****
// These methods are used to change what is happening to the snake
//*

void keyPressed() {
  //Set the direction of the snake according to the arrow keys pressed
 if (key == CODED) {
      direction = keyCode;
    } 
}

void move() {
  //Change the location of the Snake head based on the direction it is moving.


  switch(direction) {
  case UP:
    // move head up here 
    head.y = head.y-10;
    break;
  case DOWN:
    // move head down here 
    head.y = head.y+10;
    break;
  case LEFT:
    head.x = head.x-10;
    // figure it out 
    break;
  case RIGHT:
    head.x = head.x+10;
    // mystery code goes here 
    break;
  }
  checkBoundaries();
}

void checkBoundaries() {
  //If the snake leaves the frame, make it reappear on the other side
  if (direction == UP && head.y<0) {
    head.y = height - 10;
  }
  else if(direction == DOWN && head.y>height-10){
  head.y = 10;
  }
  else if(direction == LEFT && head.x<0){
  head.x = width - 10;
  }
  else if(direction == RIGHT && head.x>width-10){
  head.x = 10;
  }
}



void eat() {
  //When the snake eats the food, its tail should grow and more food appear
}
