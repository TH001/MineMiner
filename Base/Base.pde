/*
What we want to change:
 - detect wether right or left mouse button get pressed
 - use mouseclick for interactions
 - change how the player gets its coins set
 - slim code
 - diagonal movement needs fixing
 - make player stop at windowborder
 */

//import statements


//variables
public UI mainUI = new UI();

public Player player1;

public Utility util = new Utility();

private PVector newDir = new PVector();

//--------------------------------------------------------------------------------------------------
//main class body
void setup() {
  size(1000, 600);
  colorMode(RGB);
  ellipseMode(CENTER);

  //setting up player character
  player1 = new Player(50, 100);
}


//--------------------------------------------------------------------------------------------------
// draw method, gets called every frame
void draw() {
  background(50);

  //show UI
  mainUI.show(player1);

  //show Player
  player1.move(newDir);
  player1.show();
}

//--------------------------------------------------------------------------------------------------
//key registering methods
void keyPressed() {
  //detecting players movement
  if (keyCode == 38) {
    newDir.y = -1;
  }
  if (keyCode == 40) {  //down
    newDir.y = 1;
  }
  if (keyCode == 37 ) { //left
    newDir.x = -1;
  }
  if (keyCode == 39) { //right
    newDir.x = 1;
  }
}

void keyReleased() {
  switch(keyCode) {
    //movement reset
  case 37:
  case 38:
  case 39:
  case 40:
    newDir.x = 0;
    newDir.y = 0;
    break;

    //default statement
  default:
    break;
  }
}

void mousePressed() {
}